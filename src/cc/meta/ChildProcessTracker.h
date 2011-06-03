//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: ChildProcessTracker.h 385 2010-05-27 15:58:30Z sriramsrao $
//
// Created 2009/04/30
//
// Copyright 2009 Quantcast Corporation. 
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
// \brief A timer that periodically tracks child process that have been spawned
// and retrieves their completion status.
//
//----------------------------------------------------------------------------

#ifndef META_CHILDPROCESSTRACKER_H
#define META_CHILDPROCESSTRACKER_H

#include "libkfsIO/ITimeout.h"
#include <map>
#include <utility>
#include <sys/wait.h>

namespace KFS
{
	class MetaRequest;

	class ChildProcessTrackingTimer : public ITimeout {
	public:
		ChildProcessTrackingTimer(int timeoutMilliSec = 500) {
			SetTimeoutInterval(timeoutMilliSec);
		};
		// On a timeout check the child processes for exit status
		virtual void Timeout();
		// track the process with pid and return the exit status to MetaRequest
		void Track(pid_t pid, MetaRequest *r);
	private:
		typedef std::multimap<pid_t, MetaRequest *> Pending;
		Pending mPending;
	};

	extern ChildProcessTrackingTimer gChildProcessTracker;
}

#endif // META_CHILDPROCESSTRACKER_H
