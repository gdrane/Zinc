# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gauresh/spring2011/cloud/project/kosmosfs/zynx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build

# Include any dependencies generated for this target.
include src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/depend.make

# Include the progress variables for this target.
include src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/progress.make

# Include the compile flags for this target's objects.
include src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o: ../src/cc/libkfsClient/KfsRead.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsRead.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsRead.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsRead.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsRead.cc > CMakeFiles/kfsClient-shared.dir/KfsRead.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsRead.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsRead.cc -o CMakeFiles/kfsClient-shared.dir/KfsRead.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o: ../src/cc/libkfsClient/LeaseClerk.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/LeaseClerk.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/LeaseClerk.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/LeaseClerk.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/LeaseClerk.cc > CMakeFiles/kfsClient-shared.dir/LeaseClerk.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/LeaseClerk.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/LeaseClerk.cc -o CMakeFiles/kfsClient-shared.dir/LeaseClerk.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o: ../src/cc/libkfsClient/Utils.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/Utils.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/Utils.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/Utils.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/Utils.cc > CMakeFiles/kfsClient-shared.dir/Utils.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/Utils.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/Utils.cc -o CMakeFiles/kfsClient-shared.dir/Utils.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o: ../src/cc/libkfsClient/KfsProtocolWorker.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsProtocolWorker.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsProtocolWorker.cc > CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsProtocolWorker.cc -o CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o: ../src/cc/libkfsClient/KfsAsyncRW.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsAsyncRW.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsAsyncRW.cc > CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsAsyncRW.cc -o CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o: ../src/cc/libkfsClient/KfsOps.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsOps.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsOps.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsOps.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsOps.cc > CMakeFiles/kfsClient-shared.dir/KfsOps.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsOps.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsOps.cc -o CMakeFiles/kfsClient-shared.dir/KfsOps.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o: ../src/cc/libkfsClient/KfsNetClient.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsNetClient.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsNetClient.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsNetClient.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsNetClient.cc > CMakeFiles/kfsClient-shared.dir/KfsNetClient.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsNetClient.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsNetClient.cc -o CMakeFiles/kfsClient-shared.dir/KfsNetClient.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o: ../src/cc/libkfsClient/WriteAppender.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/WriteAppender.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/WriteAppender.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/WriteAppender.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/WriteAppender.cc > CMakeFiles/kfsClient-shared.dir/WriteAppender.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/WriteAppender.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/WriteAppender.cc -o CMakeFiles/kfsClient-shared.dir/WriteAppender.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o: ../src/cc/libkfsClient/KfsWrite.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsWrite.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsWrite.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsWrite.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsWrite.cc > CMakeFiles/kfsClient-shared.dir/KfsWrite.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsWrite.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsWrite.cc -o CMakeFiles/kfsClient-shared.dir/KfsWrite.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o: ../src/cc/libkfsClient/KfsClient.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsClient.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsClient.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsClient.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsClient.cc > CMakeFiles/kfsClient-shared.dir/KfsClient.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsClient.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsClient.cc -o CMakeFiles/kfsClient-shared.dir/KfsClient.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/flags.make
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o: ../src/cc/libkfsClient/KfsPendingOp.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsPendingOp.cc

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsClient-shared.dir/KfsPendingOp.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsPendingOp.cc > CMakeFiles/kfsClient-shared.dir/KfsPendingOp.i

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsClient-shared.dir/KfsPendingOp.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient/KfsPendingOp.cc -o CMakeFiles/kfsClient-shared.dir/KfsPendingOp.s

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.requires:
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.provides: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.requires
	$(MAKE) -f src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.provides.build
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.provides

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.provides.build: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o

# Object files for target kfsClient-shared
kfsClient__shared_OBJECTS = \
"CMakeFiles/kfsClient-shared.dir/KfsRead.o" \
"CMakeFiles/kfsClient-shared.dir/LeaseClerk.o" \
"CMakeFiles/kfsClient-shared.dir/Utils.o" \
"CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o" \
"CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o" \
"CMakeFiles/kfsClient-shared.dir/KfsOps.o" \
"CMakeFiles/kfsClient-shared.dir/KfsNetClient.o" \
"CMakeFiles/kfsClient-shared.dir/WriteAppender.o" \
"CMakeFiles/kfsClient-shared.dir/KfsWrite.o" \
"CMakeFiles/kfsClient-shared.dir/KfsClient.o" \
"CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o"

# External object files for target kfsClient-shared
kfsClient__shared_EXTERNAL_OBJECTS =

src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o
src/cc/libkfsClient/libkfsClient.so: src/cc/common/libkfsCommon.so
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsIO/libkfsIO.so
src/cc/libkfsClient/libkfsClient.so: src/cc/qcdio/libqcdio.so
src/cc/libkfsClient/libkfsClient.so: src/cc/common/libkfsCommon.so
src/cc/libkfsClient/libkfsClient.so: src/cc/qcdio/libqcdio.so
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build.make
src/cc/libkfsClient/libkfsClient.so: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libkfsClient.so"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kfsClient-shared.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build: src/cc/libkfsClient/libkfsClient.so
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/build

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsRead.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/LeaseClerk.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/Utils.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsProtocolWorker.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsAsyncRW.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsOps.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsNetClient.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/WriteAppender.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsWrite.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsClient.o.requires
src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires: src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/KfsPendingOp.o.requires
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/requires

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/clean:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient && $(CMAKE_COMMAND) -P CMakeFiles/kfsClient-shared.dir/cmake_clean.cmake
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/clean

src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/depend:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gauresh/spring2011/cloud/project/kosmosfs/zynx /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/libkfsClient /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cc/libkfsClient/CMakeFiles/kfsClient-shared.dir/depend

