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
include src/cc/tools/CMakeFiles/kfsls.dir/depend.make

# Include the progress variables for this target.
include src/cc/tools/CMakeFiles/kfsls.dir/progress.make

# Include the compile flags for this target's objects.
include src/cc/tools/CMakeFiles/kfsls.dir/flags.make

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o: src/cc/tools/CMakeFiles/kfsls.dir/flags.make
src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o: ../src/cc/tools/kfsls_main.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kfsls.dir/kfsls_main.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tools/kfsls_main.cc

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kfsls.dir/kfsls_main.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tools/kfsls_main.cc > CMakeFiles/kfsls.dir/kfsls_main.i

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kfsls.dir/kfsls_main.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tools/kfsls_main.cc -o CMakeFiles/kfsls.dir/kfsls_main.s

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.requires:
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.requires

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.provides: src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.requires
	$(MAKE) -f src/cc/tools/CMakeFiles/kfsls.dir/build.make src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.provides.build
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.provides

src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.provides.build: src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o

# Object files for target kfsls
kfsls_OBJECTS = \
"CMakeFiles/kfsls.dir/kfsls_main.o"

# External object files for target kfsls
kfsls_EXTERNAL_OBJECTS =

src/cc/tools/kfsls: src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o
src/cc/tools/kfsls: src/cc/tools/libtools.a
src/cc/tools/kfsls: src/cc/libkfsClient/libkfsClient.a
src/cc/tools/kfsls: src/cc/libkfsIO/libkfsIO.a
src/cc/tools/kfsls: src/cc/common/libkfsCommon.a
src/cc/tools/kfsls: /usr/local/boost_1_46_1/stage/lib/libboost_regex.a
src/cc/tools/kfsls: src/cc/qcdio/libqcdio.a
src/cc/tools/kfsls: src/cc/tools/CMakeFiles/kfsls.dir/build.make
src/cc/tools/kfsls: src/cc/tools/CMakeFiles/kfsls.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable kfsls"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kfsls.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cc/tools/CMakeFiles/kfsls.dir/build: src/cc/tools/kfsls
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/build

src/cc/tools/CMakeFiles/kfsls.dir/requires: src/cc/tools/CMakeFiles/kfsls.dir/kfsls_main.o.requires
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/requires

src/cc/tools/CMakeFiles/kfsls.dir/clean:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools && $(CMAKE_COMMAND) -P CMakeFiles/kfsls.dir/cmake_clean.cmake
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/clean

src/cc/tools/CMakeFiles/kfsls.dir/depend:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gauresh/spring2011/cloud/project/kosmosfs/zynx /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tools /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tools/CMakeFiles/kfsls.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cc/tools/CMakeFiles/kfsls.dir/depend

