//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: KfsWriter_main.cc 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2006/06/23
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
// \brief Program that writes sequentially to a file in KFS.
//
//----------------------------------------------------------------------------

#include <iostream>    
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fstream>
#include <fcntl.h>
#include "libkfsClient/KfsClient.h"

#define MIN_FILE_SIZE 2048
#define MAX_FILE_SIZE (4096 * 8)
#define MAX_FILE_NAME_LEN 256

using std::cout;
using std::endl;
using std::ifstream;
using namespace KFS;
KfsClientPtr gKfsClient;

bool doMkdir(char *dirname);
bool doFileOps(char *testDataFile, char *dirname, int seqNum, int numIter);
bool compareData(char *dst, char *src, int numBytes);
void generateData(char *testDataFile, char *buf, int numBytes);
int
main(int argc, char **argv)
{
    char dirname[256];

    if (argc < 3) {
        cout << "Usage: " << argv[0] << " <test-data-file> <kfs-client-properties file> " << endl;
        exit(0);
    }

    gKfsClient = getKfsClientFactory()->GetClient(argv[2]);
    if (!gKfsClient) {
        cout << "kfs client failed to initialize...exiting" << endl;
        exit(0);
    }
    
    srand(100);

    strcpy(dirname, "/dir1");

    doMkdir(dirname);

    if (doFileOps(argv[1], dirname, 0, 1) < 0) {
        cout << "File ops failed" << endl;
    }

#if 0
    // the second call rename once should fail
    if (doFileOps(argv[1], dirname, 0, 1) < 0) {
        cout << "File ops failed" << endl;
    }

    for (int i = 0; i < numFiles; i++) {
        if (doFileOps(dirname, 0, 10) < 0) {
            cout << "File ops failed..." << endl;
            exit(0);
        }
    }
#endif
    cout << "Test passed" << endl;
}

bool
doMkdir(char *dirname)
{
    int fd;

    cout << "Making dir: " << dirname << endl;

    fd = gKfsClient->Mkdir(dirname);
    if (fd < 0) {
        cout << "Mkdir failed: " << fd << endl;
        return false;
    }
    cout << "Mkdir returned: " << fd << endl;
    return fd > 0;
}


bool doFileOps(char *testDataFile,
               char *parentDir, int seqNum, int numIter)
{
    char *dataBuf, *kfsBuf;
    size_t numBytes = 0;
    int fd;
    char fileName[MAX_FILE_NAME_LEN];
    
    while (numBytes < MIN_FILE_SIZE) {
        numBytes = rand() % MAX_FILE_SIZE;
    }

    numBytes = 70000;

    cout << "Writing " << numBytes << endl;

    dataBuf = new char[numBytes];
    generateData(testDataFile, dataBuf, numBytes);

    memset(fileName, 0, MAX_FILE_NAME_LEN);
    snprintf(fileName, MAX_FILE_NAME_LEN, "%s/foo.%d", 
             parentDir, seqNum);

    fd = gKfsClient->Open(fileName, O_CREAT|O_RDWR);
    if (fd < 0) {
        cout << "Create failed: " << endl;
        exit(0);
    }

    kfsBuf = new char[numBytes];
    memcpy(kfsBuf, dataBuf, numBytes);

    if (gKfsClient->Write(fd, kfsBuf, numBytes) < 0) {
        cout << "Write failed: " << endl;
        exit(-1);
    }

    // flush out the write
    gKfsClient->Sync(fd);

    cout << "sync is done...writing some more" << endl;
    

    // write some more; since we are writing in sizes that are
    // different from the checksum block size, this will force reading
    // in the "block" to recompute the checksum.
    //
    if (gKfsClient->Write(fd, kfsBuf, numBytes) < 0) {
        cout << "Write failed: " << endl;
        exit(-1);
    }


    cout << "write is done...." << endl;
    gKfsClient->Close(fd);

    char newpath[256];
    snprintf(newpath, 256, "/dir1/foo.%d",
             seqNum + 5);

    // test out the O_EXCL flag and verify failure...
    fd = gKfsClient->Open(fileName, O_CREAT|O_RDWR|O_EXCL);
    if (fd > 0) {
        cout << "Failure: Create with O_EXCL on an existing file worked... " << endl;
        exit(0);
    } else {
        cout << "Crate with O_EXCL failed: " << ErrorCodeToStr(fd) << endl;
        cout << "Expected failure..." << endl;
    }


    delete [] kfsBuf;
    delete [] dataBuf;

    return 0;
}

void
generateData(char *testDataFile, char *buf, int numBytes)
{
    int i;
    ifstream ifs(testDataFile);

    if (!ifs) {
        cout << "Unable to open test data file" << endl;
        exit(0);
    }
    
    for (i = 0; i < numBytes; ++i) {
        ifs >> buf[i];
        if (ifs.eof()) {
            cout << "Test-data file is too small (" << i << " vs. data= " << numBytes << endl;
            exit(0);
        }
    }
}
    
bool
compareData(char *dst, char *src, int numBytes)
{
    int i;

    for (i = 0; i < numBytes; i++) {
        if (dst[i] == src[i])
            continue;
        cout << "Mismatch at index: " << i << endl;
        return false;
    }
    return true;
}
    
