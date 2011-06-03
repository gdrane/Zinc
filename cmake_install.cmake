# Install script for directory: /home/sumedh/kfs

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX ".")
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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/sumedh/kfs/src/cc/common/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/rebalancer/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/meta/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/chunk/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/libkfsClient/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/libkfsIO/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/tools/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/tests/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/emulator/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/telemetry/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/qcdio/cmake_install.cmake")
  INCLUDE("/home/sumedh/kfs/src/cc/access/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/sumedh/kfs/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/sumedh/kfs/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
