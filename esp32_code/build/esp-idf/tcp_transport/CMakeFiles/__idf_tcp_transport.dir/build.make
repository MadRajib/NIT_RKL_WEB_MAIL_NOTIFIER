# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/madrajib/other_folders_F/Projects/esp32/station

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/madrajib/other_folders_F/Projects/esp32/station/build

# Include any dependencies generated for this target.
include esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/depend.make

# Include the progress variables for this target.
include esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.obj: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.obj: /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.obj"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_tcp_transport.dir/transport.c.obj   -c /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport.c

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_tcp_transport.dir/transport.c.i"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport.c > CMakeFiles/__idf_tcp_transport.dir/transport.c.i

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_tcp_transport.dir/transport.c.s"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport.c -o CMakeFiles/__idf_tcp_transport.dir/transport.c.s

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj: /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ssl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj   -c /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ssl.c

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.i"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ssl.c > CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.i

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.s"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ssl.c -o CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.s

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj: /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_tcp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj   -c /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_tcp.c

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.i"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_tcp.c > CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.i

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.s"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_tcp.c -o CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.s

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj: /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ws.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj   -c /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ws.c

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.i"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ws.c > CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.i

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.s"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_ws.c -o CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.s

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/flags.make
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj: /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj   -c /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_utils.c

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.i"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_utils.c > CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.i

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.s"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && /home/madrajib/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport/transport_utils.c -o CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.s

# Object files for target __idf_tcp_transport
__idf_tcp_transport_OBJECTS = \
"CMakeFiles/__idf_tcp_transport.dir/transport.c.obj" \
"CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj" \
"CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj" \
"CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj" \
"CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj"

# External object files for target __idf_tcp_transport
__idf_tcp_transport_EXTERNAL_OBJECTS =

esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport.c.obj
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ssl.c.obj
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_tcp.c.obj
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_ws.c.obj
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/transport_utils.c.obj
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/build.make
esp-idf/tcp_transport/libtcp_transport.a: esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/madrajib/other_folders_F/Projects/esp32/station/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libtcp_transport.a"
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && $(CMAKE_COMMAND) -P CMakeFiles/__idf_tcp_transport.dir/cmake_clean_target.cmake
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_tcp_transport.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/build: esp-idf/tcp_transport/libtcp_transport.a

.PHONY : esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/build

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/clean:
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport && $(CMAKE_COMMAND) -P CMakeFiles/__idf_tcp_transport.dir/cmake_clean.cmake
.PHONY : esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/clean

esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/depend:
	cd /home/madrajib/other_folders_F/Projects/esp32/station/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/madrajib/other_folders_F/Projects/esp32/station /home/madrajib/other_folders_F/Projects/esp32/esp-idf/components/tcp_transport /home/madrajib/other_folders_F/Projects/esp32/station/build /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport /home/madrajib/other_folders_F/Projects/esp32/station/build/esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/tcp_transport/CMakeFiles/__idf_tcp_transport.dir/depend

