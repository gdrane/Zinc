//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: NetConnection.h 388 2010-05-27 16:19:12Z sriramsrao $
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

#ifndef _LIBIO_NETCONNECTION_H
#define _LIBIO_NETCONNECTION_H

#include <stdio.h>
#include "KfsCallbackObj.h"
#include "Event.h"
#include "IOBuffer.h"
#include "TcpSocket.h"

#include <boost/shared_ptr.hpp>
#include <boost/pool/pool_alloc.hpp> 
#include <list>

namespace KFS
{
class NetManager;
///
/// \file NetConnection.h
/// \brief A network connection uses TCP sockets for doing I/O.
/// 
/// A network connection contains a socket and data in buffers.
/// Whenever data is read from the socket it is held in the "in"
/// buffer; whenever data needs to be written out on the socket, that
/// data should be dropped into the "out" buffer and it will
/// eventually get sent out.
/// 

///
/// \class NetConnection
/// A net connection contains an underlying socket and is associated
/// with a KfsCallbackObj.  Whenever I/O is done on the socket (either
/// for read or write) or when an error occurs (such as the remote
/// peer closing the connection), t;he associated KfsCallbackObj is
/// called back with an event notification.
/// 
class NetConnection {
public:
    typedef boost::shared_ptr<NetConnection> NetConnectionPtr;

    /// @param[in] sock TcpSocket on which I/O can be done
    /// @param[in] c KfsCallbackObj associated with this connection
    /// @param[in] listenOnly boolean that specifies whether this
    /// connection is setup only for accepting new connections.
    NetConnection(TcpSocket *sock, KfsCallbackObj *c,
        bool listenOnly = false, bool ownsSocket = true)
        : mNetManagerEntry(),
          mListenOnly(listenOnly),
          mOwnsSocket(ownsSocket),
          mTryWrite(false),
          mCallbackObj(c),
          mSock(sock),
          mInBuffer(),
          mOutBuffer(), 
          mInactivityTimeoutSecs(-1),
          maxReadAhead(-1),
          mPeerName() {
        assert(mSock);
    } 

    ~NetConnection() {
        NetConnection::Close();
    }

    void SetOwningKfsCallbackObj(KfsCallbackObj *c) {
        mCallbackObj = c;
    }

    void EnableReadIfOverloaded() {
        mNetManagerEntry.EnableReadIfOverloaded();
        Update(false);
    }

    void SetDoingNonblockingConnect() {
        mNetManagerEntry.SetConnectPending(true);
        mTryWrite = false;
        Update(false);
    }

    /// If there is no activity on this socket for nsecs, then notify
    /// the owning object; maybe time to close the connection
    /// Setting new timeout resets the timer.
    void SetInactivityTimeout(int nsecs) {
        if (mInactivityTimeoutSecs != nsecs) {
            mInactivityTimeoutSecs = nsecs;
            Update();
        }
    }

    int GetInactivityTimeout() const {
        return mInactivityTimeoutSecs;
    }

    /// Callback for handling a read.  That is, select() thinks that
    /// data is available for reading. So, do something.  If system is
    /// overloaded and we don't have a special pass, leave the data in
    /// the buffer alone.
    void HandleReadEvent();

    /// Callback for handling a writing.  That is, select() thinks that
    /// data can be sent out.  So, do something.
    void HandleWriteEvent();

    /// Callback for handling errors.  That is, select() thinks that
    /// an error occurred.  So, do something.
    void HandleErrorEvent();

    /// Timeout call back.
    void HandleTimeoutEvent();

    /// Do we expect data to be read in?
    bool IsReadReady() const {
        return (maxReadAhead != 0);
    };

    /// Is data available for reading?
    bool HasPendingRead() const {
        return (! mInBuffer.IsEmpty());
    }

    /// Is data available for writing?
    bool IsWriteReady() const {
        return (! mOutBuffer.IsEmpty());
    }

    /// # of bytes available for writing(false), 
    int GetNumBytesToWrite() const {
        return mOutBuffer.BytesConsumable();
    }

    /// Is the connection still good?
    bool IsGood() const {
        return (mSock && mSock->IsGood());
    }

    std::string GetPeerName() const {
        if (IsGood()) {
            if (mPeerName.empty()) {
                // mutable
                const_cast<NetConnection*>(this)->mPeerName =
                    mSock->GetPeerName();
            }
            return mPeerName;
        } else {
            return (mPeerName.empty() ? std::string("not connected") :
                ("was connected to " + mPeerName));
        }
    }
        
    std::string GetSockName() const {
        return (IsGood() ? mSock->GetSockName() : std::string("not connected"));
    }

    /// Enqueue data to be sent out.
    void Write(const IOBufferData &ioBufData) {
        if (! ioBufData.IsEmpty()) {
            const bool resetTimer = mOutBuffer.IsEmpty();
            mOutBuffer.Append(ioBufData);
            Update(resetTimer);
        }
    }

    /// Enqueue data to be sent out.
    void Write(IOBuffer *ioBuf) {
        const int numBytes = ioBuf ? ioBuf->BytesConsumable() : 0;
        if (numBytes > 0) {
            const bool resetTimer = mOutBuffer.IsEmpty();
            mOutBuffer.Move(ioBuf);
            Update(resetTimer);
        }
    }

    /// Enqueue data to be sent out.
    void Write(IOBuffer *ioBuf, int numBytes) {
        const bool resetTimer = mOutBuffer.IsEmpty();
        if (ioBuf && numBytes > 0 && mOutBuffer.Move(ioBuf, numBytes) > 0) {
            Update(resetTimer);
        }
    }

    /// Enqueue data to be sent out.
    void WriteCopy(const IOBuffer *ioBuf, int numBytes) {
        const bool resetTimer = mOutBuffer.IsEmpty();
        if (ioBuf && numBytes > 0 && mOutBuffer.Copy(ioBuf, numBytes) > 0) {
            Update(resetTimer);
        }
    }

    /// Enqueue data to be sent out.
    void Write(const char *data, int numBytes) {
        const bool resetTimer = mOutBuffer.IsEmpty();
        if (mOutBuffer.CopyIn(data, numBytes) > 0) {
            Update(resetTimer);
        }
    }

    /// If there is any data to be sent out, start the send.
    void StartFlush() {
        if (mTryWrite && IsWriteReady() && IsGood()) {
            HandleWriteEvent();
        }
    }

    int GetSocketError() const {
        return (mSock ? mSock->GetSocketError() : 0);
    }

    /// Close the connection.
    void Close() {
        if (! mSock) {
            return;
        }
        // To avoid race with file descriptor number re-use by the OS,
        // remove the socket from poll set first, then close the socket.
        TcpSocket* const sock = mOwnsSocket ? mSock : 0;
        mSock = 0;
        // Clear data that can not be sent, but keep input data if any.
        mOutBuffer.Clear();
        Update();
        if (sock) {
            sock->Close();
            delete sock;
        }
    }

    int GetNumBytesToRead() const {
        return mInBuffer.BytesConsumable();
    }

    /// Set max read ahead.
    /// @param[in] read ahead amount, < 0 -- unlimited.
    void SetMaxReadAhead(int readAhead) {
        const bool update = (maxReadAhead != 0) != (readAhead != 0);
        maxReadAhead = readAhead;
        if (update) {
            Update(false);
        }
    }

    void DiscardRead() {
        const bool resetTimer = ! mInBuffer.IsEmpty();
        mInBuffer.Clear();
        Update(resetTimer);
    }

    void DiscardWrite() {
        mOutBuffer.Clear();
        Update();
    }

    class NetManagerEntry
    {
    public:
        typedef std::list<NetConnectionPtr,
            boost::fast_pool_allocator<NetConnectionPtr> > List;

        NetManagerEntry()
            : mIn(false),
              mOut(false),
              mAdded(false),
              mEnableReadIfOverloaded(false),
              mConnectPending(false),
              mFd(-1),
              mWriteByteCount(0),
              mTimerWheelSlot(-1),
              mExpirationTime(-1),
              mNetManager(0),
              mListIt()
            {}
        void EnableReadIfOverloaded()     { mEnableReadIfOverloaded  = true; }
        void SetConnectPending(bool flag) { mConnectPending = flag; }
        bool IsConnectPending() const     { return mConnectPending; }

    private:
        bool           mIn:1;
        bool           mOut:1;
        bool           mAdded:1;
        /// should we add this connection to the poll vector for reads
        /// even when the system is overloaded? 
        bool           mEnableReadIfOverloaded:1;
        bool           mConnectPending:1;
        int            mFd;
        int            mWriteByteCount;
        int            mTimerWheelSlot;
        time_t         mExpirationTime;
        NetManager*    mNetManager;
        List::iterator mListIt;

        friend class NetManager;

    private:
        NetManagerEntry(const NetManagerEntry&);
        NetManagerEntry operator=(const NetManagerEntry&);
    };
    NetManagerEntry* GetNetManagerEntry() {
        return &mNetManagerEntry;
    }
    const NetManagerEntry* GetNetManagerEntry() const {
        return &mNetManagerEntry;
    }
    void Update(bool resetTimer = true);

private:
    NetManagerEntry     mNetManagerEntry;
    const bool          mListenOnly:1;
    const bool          mOwnsSocket:1;
    bool                mTryWrite:1;
    /// KfsCallbackObj that will be notified whenever "events" occur.
    KfsCallbackObj	*mCallbackObj;
    /// Socket on which I/O will be done.
    TcpSocket*          mSock;
    /// Buffer that contains data read from the socket
    IOBuffer		mInBuffer;
    /// Buffer that contains data that should be sent out on the socket.
    IOBuffer		mOutBuffer;

    /// When was the last activity on this connection
    /// # of bytes from the out buffer that should be sent out.
    int			mInactivityTimeoutSecs;
    int                 maxReadAhead;
    std::string         mPeerName;

private:
    // No copies.
    NetConnection(const NetConnection&);
    NetConnection& operator=(const NetConnection&);
};

typedef NetConnection::NetConnectionPtr NetConnectionPtr;


}
#endif // LIBIO_NETCONNECTION_H
