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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alim/dev/mategrid

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alim/dev/mategrid/bin

# Utility rule file for push-release-branch.

CMakeFiles/push-release-branch:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alim/dev/mategrid/bin/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Pushing to compiz-0.0.1-git-series"
	cd /home/alim/dev/mategrid && git push origin compiz-0.0.1-git-series

push-release-branch: CMakeFiles/push-release-branch
push-release-branch: CMakeFiles/push-release-branch.dir/build.make
.PHONY : push-release-branch

# Rule to build all files generated by this target.
CMakeFiles/push-release-branch.dir/build: push-release-branch
.PHONY : CMakeFiles/push-release-branch.dir/build

CMakeFiles/push-release-branch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/push-release-branch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/push-release-branch.dir/clean

CMakeFiles/push-release-branch.dir/depend:
	cd /home/alim/dev/mategrid/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alim/dev/mategrid /home/alim/dev/mategrid /home/alim/dev/mategrid/bin /home/alim/dev/mategrid/bin /home/alim/dev/mategrid/bin/CMakeFiles/push-release-branch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/push-release-branch.dir/depend

