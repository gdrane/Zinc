//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: KfsNetClient.h 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2009/05/20
//
// Copyright 2009 Quantcast Corp.
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

#ifndef KFS_NET_CLIENT_H
#define KFS_NET_CLIENT_H

#include <stdint.h>
#include <cerrno>
#include <string>
#include <ostream>

namespace KFS {

class KfsOp;
class IOBuffer;
class NetManager;
class ServerLocation;

class KfsNetClient
{
private:
    class Impl;
public:
    class OpOwner
    {
        // protected:
    public:
        virtual void OpDone(
            KfsOp*    inOpPtr,
            bool      inCanceledFlag,
            IOBuffer* inBufferPtr) = 0;
        virtual ~OpOwner() {}
    friend class Impl;
    };
    struct Stats
    {
        typedef int64_t Counter;
        Stats()
            : mConnectCount(0),
              mConnectFailureCount(0),
              mNetErrorCount(0),
              mConnectionIdleTimeoutCount(0),
              mResponseTimeoutCount(0),
              mOpsQueuedCount(0),
              mOpsTimeoutCount(0),
              mOpsRetriedCount(0),
              mOpsCancelledCount(0),
              mSleepTimeSec(0)
            {}
        void Clear()
            { *this = Stats(); }
        Stats& Add(
            const Stats& inStats)
        {
            mConnectCount               += inStats.mConnectCount;
            mConnectFailureCount        += inStats.mConnectFailureCount;
            mNetErrorCount              += inStats.mNetErrorCount;
            mConnectionIdleTimeoutCount += inStats.mConnectionIdleTimeoutCount;
            mResponseTimeoutCount       += inStats.mResponseTimeoutCount;
            mOpsQueuedCount             += inStats.mOpsQueuedCount;
            mOpsTimeoutCount            += inStats.mOpsTimeoutCount;
            mOpsRetriedCount            += inStats.mOpsRetriedCount;
            mOpsCancelledCount          += inStats.mOpsCancelledCount;
            mSleepTimeSec               += inStats.mSleepTimeSec;
            return *this;
        }
        std::ostream& Display(
            std::ostream& inStream,
            const char*   inSeparatorPtr = 0,
            const char*   inDelimiterPtr = 0) const
        {
            const char* const theSeparatorPtr =
                inSeparatorPtr ? inSeparatorPtr : " ";
            const char* const theDelimiterPtr =
                inDelimiterPtr ? inDelimiterPtr : ": ";
            inStream <<
                "Connect"               << theDelimiterPtr <<
                    mConnectCount << theSeparatorPtr <<
                "ConnectFailure"        << theDelimiterPtr <<
                    mConnectFailureCount << theSeparatorPtr <<
                "NetError"              << theDelimiterPtr <<
                    mNetErrorCount << theSeparatorPtr <<
                "ConnectionIdleTimeout" << theDelimiterPtr <<
                    mConnectionIdleTimeoutCount  << theSeparatorPtr <<
                "ResponseTimeout"       << theDelimiterPtr <<
                    mResponseTimeoutCount << theSeparatorPtr <<
                "OpsQueued"             << theDelimiterPtr <<
                    mOpsQueuedCount << theSeparatorPtr <<
                "OpsTimeout"            << theDelimiterPtr <<
                    mOpsTimeoutCount << theSeparatorPtr <<
                "OpsRetried"            << theDelimiterPtr <<
                    mOpsRetriedCount << theSeparatorPtr <<
                "OpsCancelled"          << theDelimiterPtr <<
                    mOpsCancelledCount << theSeparatorPtr <<
                "SleepTimeSec"          << theDelimiterPtr <<
                    mSleepTimeSec
            ;
            return inStream;
        }
        Counter mConnectCount;
        Counter mConnectFailureCount;
        Counter mNetErrorCount;
        Counter mConnectionIdleTimeoutCount;
        Counter mResponseTimeoutCount;
        Counter mOpsQueuedCount;
        Counter mOpsTimeoutCount;
        Counter mOpsRetriedCount;
        Counter mOpsCancelledCount;
        Counter mSleepTimeSec;
    };
    enum { kErrorMaxRetryReached = -(10000 + ETIMEDOUT) };
    class EventObserver
    {
    public:
        virtual bool Event(
            int&   ioCode,
            void*& ioDataPtr) = 0;
    protected:
        EventObserver()  {}
        virtual ~EventObserver() {}
    };

    KfsNetClient(
        NetManager& inNetManager,
        std::string inHost                  = std::string(),
        int         inPort                  = 0,
        int         inMaxRetryCount         = 0,
        int         inTimeSecBetweenRetries = 10,
        int         inOpTimeoutSec          = 5  * 60,
        int         inIdleTimeoutSec        = 30 * 60,
        int64_t     inInitialSeqNum         = 1,
        const char* inLogPrefixPtr          = 0);
    virtual ~KfsNetClient();
    bool IsConnected() const;
    bool Start(
        std::string  inServerName,
        int          inServerPort,
        std::string* inErrMsgPtr,
        bool         inRetryPendingOpsFlag,
        int          inMaxRetryCount,
        int          inTimeSecBetweenRetries,
        bool         inRetryConnectOnlyFlag);
    bool SetServer(
        const ServerLocation& inLocation,
        bool                  inCancelPendingOpsFlag = true);
    void Stop();
    int GetMaxRetryCount() const;
    void SetMaxRetryCount(
        int inMaxRetryCount);
    int GetOpTimeoutSec() const;
    void SetOpTimeoutSec(
        int inTimeout);
    int GetIdleTimeoutSec() const;
    void SetIdleTimeoutSec(
        int inTimeout);
    int GetTimeSecBetweenRetries();
    void SetTimeSecBetweenRetries(
        int inTimeSec);
    bool IsAllDataSent() const;
    bool IsDataReceived() const;
    bool IsDataSent() const;
    bool IsRetryConnectOnly() const;
    bool WasDisconnected() const;
    void SetRetryConnectOnly(
        bool inFlag);
    void SetOpTimeout(
        int inOpTimeoutSec);
    void GetStats(
        Stats& outStats) const;
    bool Enqueue(
        KfsOp*    inOpPtr,
        OpOwner*  inOwnerPtr,
        IOBuffer* inBufferPtr = 0);
    bool Cancel(
        KfsOp*   inOpPtr,
        OpOwner* inOwnerPtr);
    bool Cancel();
    std::string GetServerLocation() const;
    NetManager& GetNetManager();
    const NetManager& GetNetManager() const;
    void SetEventObserver(
        EventObserver* inEventObserverPtr); // Debug hook
private:
    Impl& mImpl;
private:
    KfsNetClient(
        const KfsNetClient& inClient);
    KfsNetClient& operator=(
        const KfsNetClient& inClient);
};

}

#endif /* KFS_NET_CLIENT_H */
