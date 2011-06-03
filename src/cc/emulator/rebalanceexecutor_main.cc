//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: rebalanceexecutor_main.cc 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2008/08/27
//
//
// Copyright 2008 Quantcast Corp.
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
// \brief Driver program to run the metaserver in emulator mode and
// executes the plan for rebalancing blocks.
//
//----------------------------------------------------------------------------

#include "LayoutEmulator.h"
#include "EmulatorSetup.h"

#include "meta/util.h"
#include "common/log.h"

#include <unistd.h>

using std::string;
using std::cout;
using std::endl;

using namespace KFS;

int
main(int argc, char **argv)
{
    KFS::MsgLogger::Init(NULL);
    string logdir, cpdir, networkFn, chunkmapFn;
    string rebalancePlanFn;
    char optchar;
    bool help = false;

    while ((optchar = getopt(argc, argv, "c:l:n:b:r:h")) != -1) {
        switch (optchar) {
            case 'l': 
                logdir = optarg;
                break;
            case 'c':
                cpdir = optarg;
                break;
            case 'n':
                networkFn = optarg;
                break;
            case 'b':
                chunkmapFn = optarg;
                break;
            case 'r':
                rebalancePlanFn = optarg;
                break;
            case 'h':
                help = true;
                break;
            default:
                KFS_LOG_VA_ERROR("Unrecognized flag %c", optchar);
                help = true;
                break;
        }
    }

    if (help) {
        cout << "Usage: " << argv[0] << " [-l <logdir>] [-c <cpdir>] [-n <network def>] "
             << "[-b <chunkmap file>] [-r <rebalance plan file>]" << endl;
        exit(-1);
    }

    EmulatorSetup(logdir, cpdir, networkFn, chunkmapFn);

    gLayoutEmulator.LoadRebalancePlan(rebalancePlanFn);
    
    MsgLogger::SetLevel(MsgLogger::kLogLevelINFO);

    gLayoutEmulator.PrintChunkserverBlockCount();

    gLayoutEmulator.ExecuteRebalancePlan();

    gLayoutEmulator.DumpChunkToServerMap(".");
    gLayoutEmulator.PrintChunkserverBlockCount();
}

