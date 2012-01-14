# Install script for directory: /home/alim/dev/mategrid

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/alim/.compiz-1/metadata/mategrid.xml")
FILE(INSTALL DESTINATION "/home/alim/.compiz-1/metadata" TYPE FILE FILES "/home/alim/dev/mategrid/bin/generated/mategrid.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
		if ("$ENV{USER}" STREQUAL "root")
		    exec_program (/usr/bin/gconftool-2
			ARGS "--get-default-source"
			OUTPUT_VARIABLE ENV{GCONF_CONFIG_SOURCE})
		    exec_program (/usr/bin/gconftool-2
			ARGS "--makefile-install-rule /home/alim/dev/mategrid/bin/generated/compiz-mategrid.schemas > /dev/null")
		else ("$ENV{USER}" STREQUAL "root")
		    exec_program (/usr/bin/gconftool-2
			ARGS "--install-schema-file=/home/alim/dev/mategrid/bin/generated/compiz-mategrid.schemas > /dev/null")
		endif ("$ENV{USER}" STREQUAL "root")
		
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/alim/.gconf/schemas/compiz-mategrid.schemas")
FILE(INSTALL DESTINATION "/home/alim/.gconf/schemas" TYPE FILE FILES "/home/alim/dev/mategrid/bin/generated/compiz-mategrid.schemas")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
		if ("alim" STREQUAL "root")
		    message ("-- Installing GSettings schemas /usr/share/glib-2.0/schemas/")
		    file (INSTALL DESTINATION "/usr/share/glib-2.0/schemas/"
			  TYPE FILE
			  FILES "/home/alim/dev/mategrid/bin/generated/org.freedesktop.compiz.mategrid.gschema.xml")
		    message ("-- Recompiling GSettings schemas in /usr/share/glib-2.0/schemas/")
		    execute_process (COMMAND /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/)

		else ("alim" STREQUAL "root")
		    # It seems like this is only available in CMake > 2.8.5
		    # but hardly anybody has that, so comment out this warning for now
		    # string (FIND /usr/share/mate:/usr/local/share/:/usr/share/ "/home/alim/.config/compiz-1/gsettings/schemas" XDG_INSTALL_PATH)
		    # if (NOT XDG_INSTALL_PATH)
		    message ("[WARNING]: Installing GSettings schemas to a custom location that might not be in XDG_DATA_DIRS, you need to add /home/alim/.config/compiz-1/gsettings/schemas to your XDG_DATA_DIRS in order for GSettings schemas to be found!")
		    # endif (NOT XDG_INSTALL_PATH)
		    message ("-- Installing GSettings schemas to /home/alim/.config/compiz-1/gsettings/schemas")
		    file (INSTALL DESTINATION "/home/alim/.config/compiz-1/gsettings/schemas"
			  TYPE FILE
			  FILES "/home/alim/dev/mategrid/bin/generated/org.freedesktop.compiz.mategrid.gschema.xml")
		    message ("-- Recompiling GSettings schemas in /home/alim/.config/compiz-1/gsettings/schemas")
		    execute_process (COMMAND /usr/bin/glib-compile-schemas /home/alim/.config/compiz-1/gsettings/schemas)
		endif ("alim" STREQUAL "root")
		
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/home/alim/.compiz-1/plugins/libmategrid.so")
FILE(INSTALL DESTINATION "/home/alim/.compiz-1/plugins" TYPE SHARED_LIBRARY FILES "/home/alim/dev/mategrid/bin/libmategrid.so")
  IF(EXISTS "$ENV{DESTDIR}/home/alim/.compiz-1/plugins/libmategrid.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/alim/.compiz-1/plugins/libmategrid.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/alim/.compiz-1/plugins/libmategrid.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/alim/dev/mategrid/bin/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/alim/dev/mategrid/bin/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
