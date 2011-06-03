//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: Version.h 385 2010-05-27 15:58:30Z sriramsrao $
//
// \brief Header file for getting KFS version #'s related to builds.
//
// Created 2008/10/20
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
//----------------------------------------------------------------------------

#ifndef COMMON_KFSVERSION_H
#define COMMON_KFSVERSION_H

#include <string>

namespace KFS {
    extern const std::string KFS_BUILD_VERSION_STRING;
    extern const std::string KFS_SOURCE_REVISION_STRING;
}


#endif
