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
include src/cc/tests/CMakeFiles/mkfstree.dir/depend.make

# Include the progress variables for this target.
include src/cc/tests/CMakeFiles/mkfstree.dir/progress.make

# Include the compile flags for this target's objects.
include src/cc/tests/CMakeFiles/mkfstree.dir/flags.make

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o: src/cc/tests/CMakeFiles/mkfstree.dir/flags.make
src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o: ../src/cc/tests/mkfstree_main.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mkfstree.dir/mkfstree_main.o -c /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tests/mkfstree_main.cc

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mkfstree.dir/mkfstree_main.i"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tests/mkfstree_main.cc > CMakeFiles/mkfstree.dir/mkfstree_main.i

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mkfstree.dir/mkfstree_main.s"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tests/mkfstree_main.cc -o CMakeFiles/mkfstree.dir/mkfstree_main.s

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.requires:
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.requires

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.provides: src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.requires
	$(MAKE) -f src/cc/tests/CMakeFiles/mkfstree.dir/build.make src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.provides.build
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.provides

src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.provides.build: src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o

# Object files for target mkfstree
mkfstree_OBJECTS = \
"CMakeFiles/mkfstree.dir/mkfstree_main.o"

# External object files for target mkfstree
mkfstree_EXTERNAL_OBJECTS =

src/cc/tests/mkfstree: src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o
src/cc/tests/mkfstree: src/cc/tools/libtools.a
src/cc/tests/mkfstree: src/cc/libkfsClient/libkfsClient.a
src/cc/tests/mkfstree: src/cc/libkfsIO/libkfsIO.a
src/cc/tests/mkfstree: src/cc/common/libkfsCommon.a
src/cc/tests/mkfstree: /usr/local/boost_1_46_1/stage/lib/libboost_regex.a
src/cc/tests/mkfstree: src/cc/qcdio/libqcdio.a
src/cc/tests/mkfstree: src/cc/tests/CMakeFiles/mkfstree.dir/build.make
src/cc/tests/mkfstree: src/cc/tests/CMakeFiles/mkfstree.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mkfstree"
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mkfstree.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cc/tests/CMakeFiles/mkfstree.dir/build: src/cc/tests/mkfstree
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/build

src/cc/tests/CMakeFiles/mkfstree.dir/requires: src/cc/tests/CMakeFiles/mkfstree.dir/mkfstree_main.o.requires
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/requires

src/cc/tests/CMakeFiles/mkfstree.dir/clean:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests && $(CMAKE_COMMAND) -P CMakeFiles/mkfstree.dir/cmake_clean.cmake
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/clean

src/cc/tests/CMakeFiles/mkfstree.dir/depend:
	cd /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gauresh/spring2011/cloud/project/kosmosfs/zynx /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/src/cc/tests /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests /home/gauresh/spring2011/cloud/project/kosmosfs/zynx/build/src/cc/tests/CMakeFiles/mkfstree.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cc/tests/CMakeFiles/mkfstree.dir/depend

