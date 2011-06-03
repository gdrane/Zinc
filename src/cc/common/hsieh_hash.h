//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: hsieh_hash.h 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2008/07/17
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
// \brief String hash using Hsieh hash function.
//
//----------------------------------------------------------------------------

#ifndef COMMON_HSIEH_HASH_H
#define COMMON_HSIEH_HASH_H

#include <stdint.h>
#include <cstddef>
#include <string>
namespace KFS
{
    struct Hsieh_hash_fcn {
        std::size_t operator()(const char *data, int len) const;
        std::size_t operator()(const std::string &data) const;
    };
}

#endif // COMMON_HSIEH_HASH_H
