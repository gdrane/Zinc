//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: NetConnection.cc 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2006/03/14
//
// Copyright 2008 Quantcast Corp.
// Copyright 2006-2008 Kosmix Corp.
//
// This file is part of Kosmos File System (KFS).
//
// Licensed under the Apache License, Version 2.0
// (the "License"); you may not use this file except in compliance with
// the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied. See the License for the specific language governing
// permissions and limitations under the License.
//
// 
//----------------------------------------------------------------------------

#include <cerrno>
#include "Globals.h"
#include "NetConnection.h"
#include "common/log.h"
#include "qcdio/qcutils.h"

using namespace KFS;
using namespace KFS::libkfsio;

#ifndef NET_CONNECTION_LOG_STREAM_DEBUG
#define NET_CONNECTION_LOG_STREAM_DEBUG \
    KFS_LOG_STREAM_DEBUG << "netconn: " << (mSock ? mSock->GetFd() : -1) << " "
#endif

void NetConnection::HandleReadEvent()
{
    if (! IsGood()) {
        NET_CONNECTION_LOG_STREAM_DEBUG << "read event ignored: fd closed" <<
        KFS_LOG_EOM;
    } else if (mListenOnly) {
        TcpSocket* const sock = mSock->Accept();
        if (sock) {
            NetConnectionPtr conn(new NetConnection(sock, 0));
            conn->mTryWrite = true; // Should be connected, and good to write.
            mCallbackObj->HandleEvent(EVENT_NEW_CONNECTION, (void*)&conn);
            conn->Update();
        } else {
            NET_CONNECTION_LOG_STREAM_DEBUG <<
                " accept failure: " << QCUtils::SysError(errno) << 
                " open fd:"
                " net: "  << globals().ctrOpenDiskFds.GetValue() <<
                " disk: " << globals().ctrOpenNetFds.GetValue() <<
            KFS_LOG_EOM;
        }
    } else if (IsReadReady()) {
        const int nread = mInBuffer.Read(mSock->GetFd(), maxReadAhead);
        if (nread <= 0 && nread != -EAGAIN && nread != -EINTR) {
            NET_CONNECTION_LOG_STREAM_DEBUG <<
                "read: " << (nread == 0 ? "EOF" : QCUtils::SysError(-nread)) <<
            KFS_LOG_EOM;
            mCallbackObj->HandleEvent(EVENT_NET_ERROR, NULL);
        } else if (nread > 0) {
            mCallbackObj->HandleEvent(EVENT_NET_READ, (void *)&mInBuffer);
        }
    }
    Update();
}

void NetConnection::HandleWriteEvent()
{
    const bool wasConnectPending = mNetManagerEntry.IsConnectPending();
    mNetManagerEntry.SetConnectPending(false);
    int nwrote = 0;
    if (IsGood()) {
        nwrote = IsWriteReady() ? mOutBuffer.Write(mSock->GetFd()) : 0;
        if (nwrote < 0 && nwrote != -EAGAIN && nwrote != -EINTR) {
            NET_CONNECTION_LOG_STREAM_DEBUG <<
                "write: error: " << QCUtils::SysError(-nwrote) <<
            KFS_LOG_EOM;
            mCallbackObj->HandleEvent(EVENT_NET_ERROR, NULL);
        } else if (nwrote > 0 || wasConnectPending) {
            mCallbackObj->HandleEvent(EVENT_NET_WROTE, (void *)&mOutBuffer);
        }
    }
    mTryWrite = mOutBuffer.IsEmpty();
    Update(nwrote != 0);
}

void NetConnection::HandleErrorEvent()
{
    NET_CONNECTION_LOG_STREAM_DEBUG << "connection error, closing" <<
    KFS_LOG_EOM;
    mCallbackObj->HandleEvent(EVENT_NET_ERROR, NULL);
    Close();
}

void NetConnection::HandleTimeoutEvent()
{
    const int timeOut = GetInactivityTimeout();
    if (timeOut < 0) {
        NET_CONNECTION_LOG_STREAM_DEBUG <<
            "ignoring timeout event, time out value: " << timeOut <<
        KFS_LOG_EOM;
    } else {
        NET_CONNECTION_LOG_STREAM_DEBUG << "inactivity timeout:" <<
            " read-ahead: " << maxReadAhead <<
            " in: "  << mInBuffer.BytesConsumable() <<
            " out: " << mOutBuffer.BytesConsumable() <<
        KFS_LOG_EOM;
        mCallbackObj->HandleEvent(EVENT_INACTIVITY_TIMEOUT, NULL);
    }
    Update();
}

void NetConnection::Update(bool resetTimer)
{
    NetManager::Update(
        mNetManagerEntry, IsGood() ? mSock->GetFd() : -1, resetTimer);
}
