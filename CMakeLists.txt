#
#   QQuickMaterialHelperGallery CMake script by Olivier Le Doeuff
#

# ┌──────────────────────────────────────────────────────────────────┐
# │                       CMAKE PROPERTIES                           │
# └──────────────────────────────────────────────────────────────────┘

cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       PROJECT SETTINGS                           │
# └──────────────────────────────────────────────────────────────────┘

set(QQUICKMATERIALHELPERGALLERY_TARGET "QQuickMaterialHelperGallery" CACHE STRING "Target Name")
set(QQUICKMATERIALHELPERGALLERY_PROJECT "QQuickMaterialHelperGallery" CACHE STRING "Project Name")
set(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED OFF CACHE BOOL "Build as a shared library")
set(QQUICKMATERIALHELPERGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library")

if(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED)
    set(QQUICKMATERIALHELPERGALLERY_BUILD_EXE OFF CACHE BOOL "Build as an executable")
else()
    set(QQUICKMATERIALHELPERGALLERY_BUILD_EXE ON CACHE BOOL "Build as an executable")
endif()

set(QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE ON CACHE BOOL "Should the library be compiled with a namespace. Default: ON")
set(QQUICKMATERIALHELPERGALLERY_NAMESPACE "Qqhg" CACHE STRING "Namespace of the library is QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE is ON. Default : Qqhg")

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

set(QQUICKMATERIALHELPER_REPOSITORY "https://github.com/OlivierLDff/QQuickMaterialHelper.git" CACHE STRING "Repository of QQuickMaterialHelper")
set(QQUICKMATERIALHELPER_TAG "master" CACHE STRING "Git Tag of QQuickMaterialHelper")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       VERSION                                    │
# └──────────────────────────────────────────────────────────────────┘

# Project version must be set here
set(QQUICKMATERIALHELPERGALLERY_VERSION_MAJOR 1)
set(QQUICKMATERIALHELPERGALLERY_VERSION_MINOR 2)
set(QQUICKMATERIALHELPERGALLERY_VERSION_PATCH 0)

if(EXISTS "${CMAKE_SOURCE_DIR}/.git")
  execute_process(
    COMMAND git describe --always
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE QQUICKMATERIALHELPERGALLERY_VERSION_TAG
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
endif()

if(NOT QQUICKMATERIALHELPERGALLERY_VERSION_TAG)
    set(QQUICKMATERIALHELPERGALLERY_VERSION_TAG 00000000)
endif(NOT QQUICKMATERIALHELPERGALLERY_VERSION_TAG)
set(QQUICKMATERIALHELPERGALLERY_VERSION_TAG_HEX 0x${QQUICKMATERIALHELPERGALLERY_VERSION_TAG})
set(QQUICKMATERIALHELPERGALLERY_VERSION ${QQUICKMATERIALHELPERGALLERY_VERSION_MAJOR}.${QQUICKMATERIALHELPERGALLERY_VERSION_MINOR}.${QQUICKMATERIALHELPERGALLERY_VERSION_PATCH})


project(${QQUICKMATERIALHELPERGALLERY_PROJECT} VERSION ${QQUICKMATERIALHELPERGALLERY_VERSION} LANGUAGES CXX)
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
message(STATUS "------ ${QQUICKMATERIALHELPERGALLERY_TARGET} Configuration ------")
message(STATUS "QQUICKMATERIALHELPERGALLERY_BUILD_SHARED           : ${QQUICKMATERIALHELPERGALLERY_BUILD_SHARED}")
message(STATUS "QQUICKMATERIALHELPERGALLERY_BUILD_STATIC           : ${QQUICKMATERIALHELPERGALLERY_BUILD_STATIC}")
message(STATUS "QQUICKMATERIALHELPERGALLERY_BUILD_EXE              : ${QQUICKMATERIALHELPERGALLERY_BUILD_EXE}")
message(STATUS "QQUICKMATERIALHELPERGALLERY_VERSION                : ${QQUICKMATERIALHELPERGALLERY_VERSION}")
message(STATUS "QQUICKMATERIALHELPERGALLERY_VERSION_TAG_HEX        : ${QQUICKMATERIALHELPERGALLERY_VERSION_TAG_HEX}")
# ─── NAMESPACE ────────
message(STATUS "QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE          : ${QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE}")

if(QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE)
    message(STATUS "QQUICKMATERIALHELPERGALLERY_NAMESPACE              : ${QQUICKMATERIALHELPERGALLERY_NAMESPACE}")
endif()

message(STATUS "------ ${QQUICKMATERIALHELPERGALLERY_TARGET} End Configuration ------")

# ────────── CHECK CONFLICT ──────────────────────────────────────────

if(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED)
    if(QQUICKMATERIALHELPERGALLERY_BUILD_STATIC)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile shared and static library at the same time")
    endif()
    if(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile shared library and executable at the same time")
    endif()
endif()

if(QQUICKMATERIALHELPERGALLERY_BUILD_STATIC)
    if(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile shared and static library at the same time")
    endif()
    if(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile static library and executable at the same time")
    endif()
endif()

if(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)
    if(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile shared library and executable at the same time")
    endif()
    if(QQUICKMATERIALHELPERGALLERY_BUILD_STATIC)
        message(FATAL_ERROR "QQuickMaterialHelperGallery can't compile static library and executable at the same time")
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

# MaterialHelper
FetchContent_Declare(
    QQuickMaterialHelper
    GIT_REPOSITORY ${QQUICKMATERIALHELPER_REPOSITORY}
    GIT_TAG        ${QQUICKMATERIALHELPER_TAG}
)

set(FETCHCONTENT_UPDATES_DISCONNECTED ON)
#set(FETCHCONTENT_QUIET ON)

# Make all dependencies avaiables
FetchContent_MakeAvailable(QQuickMaterialHelper)
if(QT_STATIC)
    FetchContent_MakeAvailable(QtStaticCMake)
endif()

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

file(GLOB_RECURSE QQUICKMATERIALHELPERGALLERY_QML_SRCS qml/*.qml)

FOREACH(SOURCE IN ITEMS ${QQUICKMATERIALHELPERGALLERY_QML_SRCS})
    GET_FILENAME_COMPONENT(SOURCE_PATH "${SOURCE}" PATH)
    FILE(RELATIVE_PATH SOURCE_PATH_REL ${CMAKE_CURRENT_SOURCE_DIR} "${SOURCE_PATH}")
    STRING(REPLACE "/" "\\" GROUP_PATH "${SOURCE_PATH_REL}")
    SOURCE_GROUP("${GROUP_PATH}" FILES "${SOURCE}")
ENDFOREACH()

set(QQUICKMATERIALHELPERGALLERY_SRCS
    # Main
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/QQuickMaterialHelperGallery.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/QQuickMaterialHelperGallery.cpp
    ${QQUICKMATERIALHELPERGALLERY_QML_SRCS}
    ${CMAKE_CURRENT_SOURCE_DIR}/images/images.qrc
)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       TARGET                                     │
# └──────────────────────────────────────────────────────────────────┘

# ────────── QML TO CACHE ───────────

# Add qml to the qtquick compiler
qtquick_compiler_add_resources(QQUICKMATERIALHELPERGALLERY_QML_RES ${CMAKE_CURRENT_SOURCE_DIR}/qml/qquickHelperGallery.qrc)

# Trick to rerun cmake each time qquickHelperGallery.qrc is updated
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/qml/qquickHelperGallery.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/qml.junk
)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/images/images.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/images.junk
)

# Dont Run Moc on cpp file generated from qml
FOREACH(CacheQml ${QQUICKMATERIALHELPERGALLERY_QML_RES})
    SET_PROPERTY(SOURCE ${CacheQml} PROPERTY SKIP_AUTOMOC ON)
    SOURCE_GROUP("QtQuickCompiler Files" FILES ${CacheQml})
ENDFOREACH()

# ───── SHARED ──────────────

if(QQUICKMATERIALHELPERGALLERY_BUILD_SHARED)
    add_library(${QQUICKMATERIALHELPERGALLERY_TARGET} SHARED ${QQUICKMATERIALHELPERGALLERY_SRCS} ${QQUICKMATERIALHELPERGALLERY_QML_RES})
    target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_SHARED)
endif()

# ───── STATIC ──────────────

if(QQUICKMATERIALHELPERGALLERY_BUILD_STATIC)
    add_library(${QQUICKMATERIALHELPERGALLERY_TARGET} STATIC ${QQUICKMATERIALHELPERGALLERY_SRCS} ${QQUICKMATERIALHELPERGALLERY_QML_RES})
    target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PUBLIC -DQQUICKMATERIALHELPERGALLERY_STATIC)
endif()

# ───── EXE ──────────────

if(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)
    ADD_EXECUTABLE(${QQUICKMATERIALHELPERGALLERY_TARGET} ${QQUICKMATERIALHELPERGALLERY_SRCS} ${QQUICKMATERIALHELPERGALLERY_QML_RES})
    target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PUBLIC -DQQUICKMATERIALHELPERGALLERY_STATIC)
endif()

# ───── COMMON ──────────────

target_include_directories(${QQUICKMATERIALHELPERGALLERY_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_VERSION_MAJOR=${QQUICKMATERIALHELPERGALLERY_VERSION_MAJOR})
target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_VERSION_MINOR=${QQUICKMATERIALHELPERGALLERY_VERSION_MINOR})
target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_VERSION_PATCH=${QQUICKMATERIALHELPERGALLERY_VERSION_PATCH})
target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_VERSION_TAG=${QQUICKMATERIALHELPERGALLERY_VERSION_TAG})
target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PRIVATE -DQQUICKMATERIALHELPERGALLERY_VERSION_TAG_HEX=${QQUICKMATERIALHELPERGALLERY_VERSION_TAG_HEX})

if(QQUICKMATERIALHELPERGALLERY_USE_NAMESPACE)
    target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PUBLIC -DQQUICKMATERIALHELPERGALLERY_USE_NAMESPACE)
    target_compile_definitions(${QQUICKMATERIALHELPERGALLERY_TARGET} PUBLIC -DQQUICKMATERIALHELPERGALLERY_NAMESPACE=${QQUICKMATERIALHELPERGALLERY_NAMESPACE})
endif()

target_link_libraries(${QQUICKMATERIALHELPERGALLERY_TARGET} ${QQUICKMATERIALHELPER_TARGET})
set_target_properties(${QQUICKMATERIALHELPERGALLERY_TARGET} PROPERTIES AUTOMOC TRUE)
set_target_properties(${QQUICKMATERIALHELPERGALLERY_TARGET} PROPERTIES AUTORCC TRUE)
qt5_use_modules(${QQUICKMATERIALHELPERGALLERY_TARGET} Core Gui Svg Xml XmlPatterns Quick QuickControls2)

if(QT_STATIC)
    qt_generate_qml_plugin_import(${QQUICKMATERIALHELPERGALLERY_TARGET} QML_SRC ${CMAKE_CURRENT_SOURCE_DIR}/qml VERBOSE)
    qt_generate_plugin_import(${QQUICKMATERIALHELPERGALLERY_TARGET} VERBOSE)
endif(QT_STATIC)

# ────────── POST BUILD PLATFORM DEPENDANCIES ─────────────

include(${CMAKE_CURRENT_SOURCE_DIR}/platform/PostBuildPlatform.cmake)