#
#   QaterialGallery CMake script by Olivier Le Doeuff
#

# ┌──────────────────────────────────────────────────────────────────┐
# │                       CMAKE PROPERTIES                           │
# └──────────────────────────────────────────────────────────────────┘

cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       PROJECT SETTINGS                           │
# └──────────────────────────────────────────────────────────────────┘

set(QATERIALGALLERY_TARGET "QaterialGallery" CACHE STRING "Target Name")
set(QATERIALGALLERY_PROJECT "QaterialGallery" CACHE STRING "Project Name")
set(QATERIALGALLERY_BUILD_SHARED OFF CACHE BOOL "Build as a shared library")
set(QATERIALGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library")

if(QATERIALGALLERY_BUILD_SHARED)
    set(QATERIALGALLERY_BUILD_EXE OFF CACHE BOOL "Build as an executable")
else()
    set(QATERIALGALLERY_BUILD_EXE ON CACHE BOOL "Build as an executable")
endif()

set(QATERIALGALLERY_USE_NAMESPACE ON CACHE BOOL "Should the library be compiled with a namespace. Default: ON")
set(QATERIALGALLERY_NAMESPACE "Qqhg" CACHE STRING "Namespace of the library is QATERIALGALLERY_USE_NAMESPACE is ON. Default : Qg")

set(QTANDROIDCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtAndroidCMake.git" CACHE STRING "Repository of QtAndroidCMake")
set(QTANDROIDCMAKE_TAG "master" CACHE STRING "Git Tag of QtAndroidCMake")

set(QTWINDOWSCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtWindowsCMake" CACHE STRING "Repository of QtAndroidCMake")
set(QTWINDOWSCMAKE_TAG "master" CACHE STRING "Git Tag of QtAndroidCMake")

set(QTANDROIDCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtAndroidCMake.git" CACHE STRING "Qt Android CMake repository, can be a local URL")
set(QTANDROIDCMAKE_TAG master CACHE STRING "Qt Android CMake git tag")

set(QTSTATICCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtStaticCMake.git" CACHE STRING "QtStaticCMake repository, can be a local URL")
set(QTSTATICCMAKE_TAG master CACHE STRING "QtStaticCMake git tag")

set(QQTIOSCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtIosCMake.git" CACHE STRING "QtIosCMake repository, can be a local URL")
set(QQTIOSCMAKE_TAG master CACHE STRING "QtIosCMake git tag")

set(QBC_REPOSITORY "https://github.com/OlivierLdff/QBCInstaller.git" CACHE STRING "QBC repository, can be a local URL")
set(QBC_TAG master CACHE STRING "QBC git tag")

set(QATERIAL_REPOSITORY "https://github.com/OlivierLDff/Qaterial.git" CACHE STRING "Repository of Qaterial")
set(QATERIAL_TAG "master" CACHE STRING "Git Tag of Qaterial")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       VERSION                                    │
# └──────────────────────────────────────────────────────────────────┘

# Project version must be set here
set(QATERIALGALLERY_VERSION_MAJOR 1)
set(QATERIALGALLERY_VERSION_MINOR 3)
set(QATERIALGALLERY_VERSION_PATCH 0)

if(EXISTS "${CMAKE_SOURCE_DIR}/.git")
  execute_process(
    COMMAND git describe --always
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE QATERIALGALLERY_VERSION_TAG
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
endif()

if(NOT QATERIALGALLERY_VERSION_TAG)
    set(QATERIALGALLERY_VERSION_TAG 00000000)
endif(NOT QATERIALGALLERY_VERSION_TAG)
set(QATERIALGALLERY_VERSION_TAG_HEX 0x${QATERIALGALLERY_VERSION_TAG})
set(QATERIALGALLERY_VERSION ${QATERIALGALLERY_VERSION_MAJOR}.${QATERIALGALLERY_VERSION_MINOR}.${QATERIALGALLERY_VERSION_PATCH})


project(${QATERIALGALLERY_PROJECT} VERSION ${QATERIALGALLERY_VERSION} LANGUAGES CXX)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# ────────── PRE BUILD PLATFORM DEPENDANCIES ─────────────

include(${CMAKE_CURRENT_SOURCE_DIR}/platform/PreBuildPlatform.cmake)

# ┌──────────────────────────────────────────────────────────────────┐
# │                         QT5 CMAKE                                │
# └──────────────────────────────────────────────────────────────────┘

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5Quick CONFIG REQUIRED)
find_package(Qt5QuickControls2 CONFIG REQUIRED)
find_package(Qt5QuickCompiler CONFIG REQUIRED)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       STATUS                                     │
# └──────────────────────────────────────────────────────────────────┘

# ─── GLOBAL ────────
message(STATUS "------ ${QATERIALGALLERY_TARGET} Configuration ------")
message(STATUS "QATERIALGALLERY_BUILD_SHARED           : ${QATERIALGALLERY_BUILD_SHARED}")
message(STATUS "QATERIALGALLERY_BUILD_STATIC           : ${QATERIALGALLERY_BUILD_STATIC}")
message(STATUS "QATERIALGALLERY_BUILD_EXE              : ${QATERIALGALLERY_BUILD_EXE}")
message(STATUS "QATERIALGALLERY_VERSION                : ${QATERIALGALLERY_VERSION}")
message(STATUS "QATERIALGALLERY_VERSION_TAG_HEX        : ${QATERIALGALLERY_VERSION_TAG_HEX}")
# ─── NAMESPACE ────────
message(STATUS "QATERIALGALLERY_USE_NAMESPACE          : ${QATERIALGALLERY_USE_NAMESPACE}")

if(QATERIALGALLERY_USE_NAMESPACE)
    message(STATUS "QATERIALGALLERY_NAMESPACE              : ${QATERIALGALLERY_NAMESPACE}")
endif()

message(STATUS "------ ${QATERIALGALLERY_TARGET} End Configuration ------")

# ────────── CHECK CONFLICT ──────────────────────────────────────────

if(QATERIALGALLERY_BUILD_SHARED)
    if(QATERIALGALLERY_BUILD_STATIC)
        message(FATAL_ERROR "QaterialGallery can't compile shared and static library at the same time")
    endif()
    if(QATERIALGALLERY_BUILD_EXE)
        message(FATAL_ERROR "QaterialGallery can't compile shared library and executable at the same time")
    endif()
endif()

if(QATERIALGALLERY_BUILD_STATIC)
    if(QATERIALGALLERY_BUILD_SHARED)
        message(FATAL_ERROR "QaterialGallery can't compile shared and static library at the same time")
    endif()
    if(QATERIALGALLERY_BUILD_EXE)
        message(FATAL_ERROR "QaterialGallery can't compile static library and executable at the same time")
    endif()
endif()

if(QATERIALGALLERY_BUILD_EXE)
    if(QATERIALGALLERY_BUILD_SHARED)
        message(FATAL_ERROR "QaterialGallery can't compile shared library and executable at the same time")
    endif()
    if(QATERIALGALLERY_BUILD_STATIC)
        message(FATAL_ERROR "QaterialGallery can't compile static library and executable at the same time")
    endif()
endif()

# ┌──────────────────────────────────────────────────────────────────┐
# │                       DEPENDENCIES                               │
# └──────────────────────────────────────────────────────────────────┘

include(FetchContent)

# QtStaticCMake
FetchContent_Declare(
    QtStaticCMake
    GIT_REPOSITORY ${QTSTATICCMAKE_REPOSITORY}
    GIT_TAG        ${QTSTATICCMAKE_TAG}
)

# Qaterial
set(QATERIAL_FOLDER_PREFIX "Dependencies/Qaterial" CACHE STRING "")
FetchContent_Declare(
    Qaterial
    GIT_REPOSITORY ${QATERIAL_REPOSITORY}
    GIT_TAG        ${QATERIAL_TAG}
)

set(FETCHCONTENT_UPDATES_DISCONNECTED ON)
#set(FETCHCONTENT_QUIET ON)

# Make all dependencies avaiables
FetchContent_MakeAvailable(Qaterial)
if(QT_STATIC)
    FetchContent_MakeAvailable(QtStaticCMake)
endif()

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

file(GLOB_RECURSE QATERIALGALLERY_QML_SRCS qml/*.qml)

FOREACH(SOURCE IN ITEMS ${QATERIALGALLERY_QML_SRCS})
    GET_FILENAME_COMPONENT(SOURCE_PATH "${SOURCE}" PATH)
    FILE(RELATIVE_PATH SOURCE_PATH_REL ${CMAKE_CURRENT_SOURCE_DIR} "${SOURCE_PATH}")
    STRING(REPLACE "/" "\\" GROUP_PATH "${SOURCE_PATH_REL}")
    SOURCE_GROUP("${GROUP_PATH}" FILES "${SOURCE}")
ENDFOREACH()

set(QATERIALGALLERY_SRCS
    # Main
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/include/QaterialGallery.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/QaterialGallery.cpp
    ${QATERIALGALLERY_QML_SRCS}
    ${CMAKE_CURRENT_SOURCE_DIR}/images/images.qrc
)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       TARGET                                     │
# └──────────────────────────────────────────────────────────────────┘

# ────────── QML TO CACHE ───────────

# Add qml to the qtquick compiler
qtquick_compiler_add_resources(QATERIALGALLERY_QML_RES ${CMAKE_CURRENT_SOURCE_DIR}/qml/qaterialGallery.qrc)

# Trick to rerun cmake each time qaterialGallery.qrc is updated
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/qml/qaterialGallery.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/qml.junk
)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/images/images.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/images.junk
)

# Dont Run Moc on cpp file generated from qml
FOREACH(CacheQml ${QATERIALGALLERY_QML_RES})
    SET_PROPERTY(SOURCE ${CacheQml} PROPERTY SKIP_AUTOMOC ON)
    SOURCE_GROUP("QtQuickCompiler Files" FILES ${CacheQml})
ENDFOREACH()

# ───── SHARED ──────────────

if(QATERIALGALLERY_BUILD_SHARED)
    add_library(${QATERIALGALLERY_TARGET} SHARED ${QATERIALGALLERY_SRCS} ${QATERIALGALLERY_QML_RES})
    target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_SHARED)
endif()

# ───── STATIC ──────────────

if(QATERIALGALLERY_BUILD_STATIC)
    add_library(${QATERIALGALLERY_TARGET} STATIC ${QATERIALGALLERY_SRCS} ${QATERIALGALLERY_QML_RES})
    target_compile_definitions(${QATERIALGALLERY_TARGET} PUBLIC -DQATERIALGALLERY_STATIC)
endif()

# ───── EXE ──────────────

if(QATERIALGALLERY_BUILD_EXE)
    ADD_EXECUTABLE(${QATERIALGALLERY_TARGET} ${QATERIALGALLERY_SRCS} ${QATERIALGALLERY_QML_RES})
    target_compile_definitions(${QATERIALGALLERY_TARGET} PUBLIC -DQATERIALGALLERY_STATIC)
endif()

# ───── COMMON ──────────────

target_include_directories(${QATERIALGALLERY_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src/include)
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_MAJOR=${QATERIALGALLERY_VERSION_MAJOR})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_MINOR=${QATERIALGALLERY_VERSION_MINOR})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_PATCH=${QATERIALGALLERY_VERSION_PATCH})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_TAG=${QATERIALGALLERY_VERSION_TAG})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_TAG_HEX=${QATERIALGALLERY_VERSION_TAG_HEX})

if(QATERIALGALLERY_USE_NAMESPACE)
    target_compile_definitions(${QATERIALGALLERY_TARGET} PUBLIC -DQATERIALGALLERY_USE_NAMESPACE)
    target_compile_definitions(${QATERIALGALLERY_TARGET} PUBLIC -DQATERIALGALLERY_NAMESPACE=${QATERIALGALLERY_NAMESPACE})
endif()

target_link_libraries(${QATERIALGALLERY_TARGET} ${QATERIAL_TARGET})
set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES AUTOMOC TRUE)
set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES AUTORCC TRUE)
qt5_use_modules(${QATERIALGALLERY_TARGET} Core Gui Svg Xml XmlPatterns Quick QuickControls2)

if(QT_STATIC)
    qt_generate_qml_plugin_import(${QATERIALGALLERY_TARGET} QML_SRC ${CMAKE_CURRENT_SOURCE_DIR}/qml VERBOSE)
    qt_generate_plugin_import(${QATERIALGALLERY_TARGET} VERBOSE)
endif(QT_STATIC)

# ────────── POST BUILD PLATFORM DEPENDANCIES ─────────────

include(${CMAKE_CURRENT_SOURCE_DIR}/platform/PostBuildPlatform.cmake)