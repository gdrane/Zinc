//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: BufferedLogWriter.h 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2010/03/02
//
// Copyright 2010 Quantcast Corp.
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

#ifndef BUFFEREDLOGWRITER_H
#define BUFFEREDLOGWRITER_H

#include <inttypes.h>
#include <stdarg.h>

namespace KFS
{
class Properties;

class BufferedLogWriter
{
public:
    enum LogLevel
    {
        kLogLevelEMERG  = 0, 
        kLogLevelFATAL  = 0,
        kLogLevelALERT  = 100,
        kLogLevelCRIT   = 200,
        kLogLevelERROR  = 300, 
        kLogLevelWARN   = 400,
        kLogLevelNOTICE = 500,
        kLogLevelINFO   = 600,
        kLogLevelDEBUG  = 700,
        kLogLevelNOTSET = 800
    };
    struct Counters
    {
        int64_t mAppendCount;
        int64_t mDroppedCount;
        int64_t mWriteErrorCount;
        int64_t mAppendWaitCount;
        int64_t mAppendWaitMicroSecs;
    };
    BufferedLogWriter(
        int         inFd                        = -1,
        const char* inFileNamePtr               = 0,
        int         inBufSize                   = 1 << 20,
        const char* inTrucatedSuffixPtr         = 0,
        int64_t     inOpenRetryIntervalMicroSec = 5000000,
        int64_t     inFlushIntervalMicroSec     = 1000000,
        int64_t     inMaxLogFileSize            = -1,
        int         inMaxLogsFiles              = -1,
        LogLevel    inLogLevel                  = kLogLevelDEBUG,
        int64_t     inMaxLogWaitTimeMicroSec    = -1,
        const char* inTimeStampFormatPtr        = 0,      // see strftime
        bool        inUseGMTFlag                = false); // GMT vs local
    ~BufferedLogWriter();
    void SetParameters(
        const Properties& inProps,
        const char*       inPropsPrefixPtr = 0);
    bool Reopen();
    void Close();
    void Stop();
    int Open(
        const char* inFileNamePtr,
        int         inOpenMode,
        int         inOpenFlags,
        bool        inOpenHereFlag = false);
    int Open(
        const char* inFileNamePtr);
    bool AddLogFileNamePrefix(
        const char* inFileNamePtr);
    void ClearLogFileNamePrefixes();
    void Flush();
    void SetMaxLogWaitTime(
        int64_t inMaxLogWaitTimeMicroSec);
    void SetFlushInterval(
        int64_t inMicroSecs);
    void SetLogLevel(
        LogLevel inLogLevel)
        { mLogLevel = inLogLevel; }
    bool SetLogLevel(
        const char* inLogLevelNamePtr);
    LogLevel GetLogLevel() const
        { return mLogLevel; }
    static const char* GetLogLevelNamePtr(
        LogLevel inLogLevel);
    bool IsLogLevelEnabled(
        LogLevel inLogLevel) const
        { return (mLogLevel >= inLogLevel); }
    void Append(
        LogLevel    inLogLevel,
        const char* inFmtStrPtr,
        ...)
    {
        if (mLogLevel < inLogLevel) {
            return;
        }
        va_list theArgs;
        va_start(theArgs, inFmtStrPtr);
        Append(inLogLevel, inFmtStrPtr, theArgs);
        va_end(theArgs);
    }
    void Append(
        LogLevel    inLogLevel,
        const char* inFmtStrPtr,
        va_list     inArgs);
    void GetCounters(
        Counters& outCounters);
private:
    class Impl;
    volatile LogLevel mLogLevel;
    Impl&             mImpl;

private:
    BufferedLogWriter(
        const BufferedLogWriter& inWriter);
    BufferedLogWriter& operator=(
        const BufferedLogWriter& inWriter);
};
}

#endif /* BUFFEREDLOGWRITER_H */
