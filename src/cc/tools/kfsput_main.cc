//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: kfsput_main.cc 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2006/10/28
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
// \brief Program that behaves like cat: cat foo | KfsPut <filename>
//----------------------------------------------------------------------------

#include <iostream>    
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fstream>
#include "libkfsClient/KfsClient.h"
#include "common/log.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

using std::cout;
using std::cin;
using std::endl;
using std::ifstream;
using std::string;

using namespace KFS;

KfsClientPtr gKfsClient;

static ssize_t doPut(const string &kfspathname);

int
main(int argc, char **argv)
{
    char optchar;
    string kfspathname = "";
    string serverHost = "";
    int port = -1;
    bool help = false, verboseLogging = false;
    ssize_t numBytes;

    while ((optchar = getopt(argc, argv, "hs:p:d:v")) != -1) {
        switch (optchar) {
            case 'f':
                kfspathname = optarg;
                break;
            case 's':
                serverHost = optarg;
                break;
            case 'p':
                port = atoi(optarg);
                break;
            case 'h':
                help = true;
                break;
            case 'v':
                verboseLogging = true;
                break;
            default:
                cout << "Unrecognized flag : " << optchar << endl;
                help = true;
                break;
        }
    }

    if (help || (kfspathname == "") || (serverHost == "") || (port < 0)) {
        cout << "Usage: " << argv[0] << " -s <meta server name> -p <port> "
             << " -f <Kfs file> {-v}" << endl;
        exit(0);
    }

    gKfsClient = getKfsClientFactory()->GetClient(serverHost, port);
    if (!gKfsClient) {
        cout << "kfs client failed to initialize...exiting" << endl;
        exit(-1);
    }

    if (verboseLogging) {
        KFS::MsgLogger::SetLevel(KFS::MsgLogger::kLogLevelDEBUG);
    } else {
        KFS::MsgLogger::SetLevel(KFS::MsgLogger::kLogLevelINFO);
    } 

    numBytes = doPut(kfspathname);
    cout << "Wrote " << numBytes << " to " << kfspathname << endl;

    
}

ssize_t
doPut(const string &filename)
{
    const size_t mByte = 1024 * 1024;
    char dataBuf[mByte];
    int res, fd;
    size_t bytesWritten = 0;
    size_t pos = 0;
    char c;


    fd = gKfsClient->Open(filename.c_str(), O_CREAT|O_RDWR|O_APPEND);
    if (fd < 0) {
        cout << "Create failed: " << endl;
        exit(0);
    }

    while(cin.get(c)) {
        dataBuf[pos] = c;
        pos++;
        if (pos >= mByte) {
            res = gKfsClient->Write(fd, dataBuf, mByte);
            if (res != (int) mByte) {
                cout << "Write failed...expect to write: " << mByte;
                cout << " but only wrote: " << res << endl;
                return res;
            }
            bytesWritten += mByte;
            pos = 0;
        }
    }

    if (pos > 0) {
        res = gKfsClient->Write(fd, dataBuf, pos);
        if (res != (int) pos) {
            cout << "Write failed...expect to write: " << pos;
            cout << " but only wrote: " << res << endl;
            return res;
        }
        bytesWritten += pos;
    }

    gKfsClient->Close(fd);

    return bytesWritten;
}
    
