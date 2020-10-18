#
#   QaterialGallery CMake script by Olivier Le Doeuff
#

# ┌──────────────────────────────────────────────────────────────────┐
# │                       CMAKE PROPERTIES                           │
# └──────────────────────────────────────────────────────────────────┘

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       PROJECT SETTINGS                           │
# └──────────────────────────────────────────────────────────────────┘

set(QATERIALGALLERY_PROJECT "QaterialGallery" CACHE STRING "Qaterial Gallery Project Name")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       VERSION                                    │
# └──────────────────────────────────────────────────────────────────┘

# Project version must be set here
set(QATERIALGALLERY_VERSION_MAJOR 1)
set(QATERIALGALLERY_VERSION_MINOR 4)
set(QATERIALGALLERY_VERSION_PATCH 0)
set(QATERIALGALLERY_VERSION ${QATERIALGALLERY_VERSION_MAJOR}.${QATERIALGALLERY_VERSION_MINOR}.${QATERIALGALLERY_VERSION_PATCH})

project(${QATERIALGALLERY_PROJECT} VERSION ${QATERIALGALLERY_VERSION} LANGUAGES CXX)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(QATERIALGALLERY_TARGET ${QATERIALGALLERY_PROJECT} CACHE STRING "Qaterial Gallery Target Name")
if(${CMAKE_SYSTEM_NAME} STREQUAL "Android")
  set(QATERIALGALLERY_BUILD_SHARED ON CACHE BOOL "Build as a shared library (Default for Android build)" FORCE)
else()
  set(QATERIALGALLERY_BUILD_SHARED OFF CACHE BOOL "Build as a shared library")
endif()
set(QATERIALGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library")

set(QATERIALGALLERY_IGNORE_ENV OFF CACHE BOOL "The executable will discard system qt, and will try to use qt binary deploy along the target. Should be ON when deploying installer")
set(QATERIALGALLERY_ENABLE_PCH ON CACHE BOOL
 "Enable precompile headers support for 'QaterialGallery'. \"
 Only work if CMake support 'target_precompile_headers'. \"
 This can speed up compilation time.")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       DEPENDENCIES                               │
# └──────────────────────────────────────────────────────────────────┘

find_package(Qt5 REQUIRED COMPONENTS
  Core
  Qml
  Gui
  Quick
  QuickControls2
  Svg
  Xml
  QuickCompiler
)
find_package(Qt5 QUIET COMPONENTS QmlWorkerScript)

include(cmake/Dependencies.cmake)
include(cmake/FetchSpdlog.cmake)
include(cmake/FetchQaterial.cmake)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       STATUS                                     │
# └──────────────────────────────────────────────────────────────────┘

# ─── GLOBAL ────

message(STATUS "------ ${QATERIALGALLERY_TARGET} v${QATERIALGALLERY_VERSION} Configuration ------")
message(STATUS "QATERIALGALLERY_BUILD_SHARED           : ${QATERIALGALLERY_BUILD_SHARED}")
message(STATUS "QATERIALGALLERY_BUILD_STATIC           : ${QATERIALGALLERY_BUILD_STATIC}")
message(STATUS "QATERIALGALLERY_IGNORE_ENV             : ${QATERIALGALLERY_IGNORE_ENV}")
message(STATUS "------ ${QATERIALGALLERY_TARGET} End Configuration ------")

# ──── CHECK CONFLICT ────

if(QATERIALGALLERY_BUILD_SHARED AND QATERIALGALLERY_BUILD_STATIC)
    message(FATAL_ERROR "QaterialGallery can't compile shared and static library at the same time")
endif()

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

qt_generate_qmldir(QATERIALGALLERY_QMLDIR_FILE
 SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery
 MODULE "QaterialGallery")

qt_generate_qrc(QATERIALGALLERY_QML_QRC
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery
  DEST_DIR ${CMAKE_CURRENT_BINARY_DIR}/QaterialGalleryGenerated
  NAME QaterialGallery.qrc
  PREFIX "QaterialGallery"
  GLOB_EXPRESSION "*.qml;qmldir"
  RECURSE)

qt_generate_qrc(QATERIALGALLERY_RES_QML_QRC
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery
  DEST_DIR ${CMAKE_CURRENT_BINARY_DIR}/QaterialGalleryGenerated
  NAME QaterialGalleryRes.qrc
  PREFIX "QaterialGallery"
  GLOB_EXPRESSION "*.png;*svg"
  RECURSE)

qtquick_compiler_add_resources(QATERIALGALLERY_QML_RES ${QATERIALGALLERY_QML_QRC})
file(GLOB_RECURSE QATERIALGALLERY_QML_SRCS qml/QaterialGallery/*.qml)
source_group("Qml" FILES "${QATERIALGALLERY_QML_SRCS}")

set(QATERIALGALLERY_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp
  ${QATERIALGALLERY_QML_RES}
  ${QATERIALGALLERY_RES_QML_QRC}
)

# Dont Run Moc on cpp file generated from qml
foreach(GENERATED_RES ${QATERIALGALLERY_QML_RES})
  set_property(SOURCE ${GENERATED_RES} PROPERTY SKIP_AUTOMOC ON)
  source_group("QtQuickCompiler Files" FILES ${GENERATED_RES})
endforeach()

# ──── TARGET ────

if(QATERIALGALLERY_BUILD_SHARED)
  add_library(${QATERIALGALLERY_TARGET} SHARED ${QATERIALGALLERY_SRCS})
  target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_SHARED)
else()
  if(QATERIALGALLERY_BUILD_STATIC)
    add_library(${QATERIALGALLERY_TARGET} STATIC ${QATERIALGALLERY_SRCS})
  else()
    add_executable(${QATERIALGALLERY_TARGET} ${QATERIALGALLERY_SRCS})
  endif()
  target_compile_definitions(${QATERIALGALLERY_TARGET} PUBLIC -DQATERIALGALLERY_STATIC)
endif()

# ──── SETTINGS ────

target_compile_features(${QATERIALGALLERY_TARGET} PUBLIC cxx_std_11)

if(QATERIALGALLERY_IGNORE_ENV)
  message(STATUS "The executable will discard every ")
  target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_IGNORE_ENV)
endif()

if(QATERIALGALLERY_ENABLE_PCH AND COMMAND target_precompile_headers)
  target_precompile_headers(${QATERIALGALLERY_TARGET} PRIVATE include/QaterialGallery/Pch/Pch.hpp)
endif()

# ──── DEPENDENCIES ────

set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES
  AUTOMOC TRUE
  AUTORCC TRUE)
target_link_libraries(${QATERIALGALLERY_TARGET} PRIVATE
  Qaterial
  spdlog
)

# ────────── POST BUILD PLATFORM DEPENDANCIES ─────────────

include(platforms/Deploy.cmake)