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
include src/cc/qcdio/CMakeFiles/qcdio.dir/depend.make

# Include the progress variables for this target.
include src/cc/qcdio/CMakeFiles/qcdio.dir/progress.make

# Include the compile flags for this target's objects.
include src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o: ../src/cc/qcdio/qcutils.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcutils.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcutils.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcutils.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcutils.cpp > CMakeFiles/qcdio.dir/qcutils.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcutils.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcutils.cpp -o CMakeFiles/qcdio.dir/qcutils.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o: ../src/cc/qcdio/qcmutex.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcmutex.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcmutex.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcmutex.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcmutex.cpp > CMakeFiles/qcdio.dir/qcmutex.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcmutex.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcmutex.cpp -o CMakeFiles/qcdio.dir/qcmutex.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o: ../src/cc/qcdio/qcdiskqueue.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcdiskqueue.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcdiskqueue.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcdiskqueue.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcdiskqueue.cpp > CMakeFiles/qcdio.dir/qcdiskqueue.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcdiskqueue.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcdiskqueue.cpp -o CMakeFiles/qcdio.dir/qcdiskqueue.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o: ../src/cc/qcdio/qcthread.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcthread.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcthread.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcthread.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcthread.cpp > CMakeFiles/qcdio.dir/qcthread.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcthread.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcthread.cpp -o CMakeFiles/qcdio.dir/qcthread.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o: ../src/cc/qcdio/qcunittest.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcunittest.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcunittest.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcunittest.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcunittest.cpp > CMakeFiles/qcdio.dir/qcunittest.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcunittest.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcunittest.cpp -o CMakeFiles/qcdio.dir/qcunittest.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o: ../src/cc/qcdio/qciobufferpool.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qciobufferpool.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qciobufferpool.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qciobufferpool.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qciobufferpool.cpp > CMakeFiles/qcdio.dir/qciobufferpool.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qciobufferpool.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qciobufferpool.cpp -o CMakeFiles/qcdio.dir/qciobufferpool.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o: src/cc/qcdio/CMakeFiles/qcdio.dir/flags.make
src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o: ../src/cc/qcdio/qcfdpoll.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/qcdio.dir/qcfdpoll.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcfdpoll.cpp

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/qcdio.dir/qcfdpoll.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcfdpoll.cpp > CMakeFiles/qcdio.dir/qcfdpoll.i

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/qcdio.dir/qcfdpoll.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio/qcfdpoll.cpp -o CMakeFiles/qcdio.dir/qcfdpoll.s

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.requires:
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.requires

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.provides: src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.requires
	$(MAKE) -f src/cc/qcdio/CMakeFiles/qcdio.dir/build.make src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.provides.build
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.provides

src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.provides.build: src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o

# Object files for target qcdio
qcdio_OBJECTS = \
"CMakeFiles/qcdio.dir/qcutils.o" \
"CMakeFiles/qcdio.dir/qcmutex.o" \
"CMakeFiles/qcdio.dir/qcdiskqueue.o" \
"CMakeFiles/qcdio.dir/qcthread.o" \
"CMakeFiles/qcdio.dir/qcunittest.o" \
"CMakeFiles/qcdio.dir/qciobufferpool.o" \
"CMakeFiles/qcdio.dir/qcfdpoll.o"

# External object files for target qcdio
qcdio_EXTERNAL_OBJECTS =

src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/build.make
src/cc/qcdio/libqcdio.a: src/cc/qcdio/CMakeFiles/qcdio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libqcdio.a"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && $(CMAKE_COMMAND) -P CMakeFiles/qcdio.dir/cmake_clean_target.cmake
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qcdio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cc/qcdio/CMakeFiles/qcdio.dir/build: src/cc/qcdio/libqcdio.a
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/build

src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcutils.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcmutex.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcdiskqueue.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcthread.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcunittest.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qciobufferpool.o.requires
src/cc/qcdio/CMakeFiles/qcdio.dir/requires: src/cc/qcdio/CMakeFiles/qcdio.dir/qcfdpoll.o.requires
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/requires

src/cc/qcdio/CMakeFiles/qcdio.dir/clean:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio && $(CMAKE_COMMAND) -P CMakeFiles/qcdio.dir/cmake_clean.cmake
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/clean

src/cc/qcdio/CMakeFiles/qcdio.dir/depend:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gauresh/spring2011/cloud/project/kosmosfs/zynx /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/qcdio /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/qcdio/CMakeFiles/qcdio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cc/qcdio/CMakeFiles/qcdio.dir/depend

