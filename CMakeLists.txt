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

set(SPDLOG_REPOSITORY "https://github.com/gabime/spdlog" CACHE STRING "Repository of spdlog")
set(SPDLOG_TAG "v1.x" CACHE STRING "Git tag/branch of spdlog")

set(QATERIAL_REPOSITORY "https://github.com/OlivierLDff/Qaterial.git" CACHE STRING "Repository of Qaterial")
set(QATERIAL_TAG "master" CACHE STRING "Git Tag of Qaterial")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       VERSION                                    │
# └──────────────────────────────────────────────────────────────────┘

# Project version must be set here
set(QATERIALGALLERY_VERSION_MAJOR 1)
set(QATERIALGALLERY_VERSION_MINOR 4)
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

find_package(Qt5Core            CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Gui             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Qml             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5QmlWorkerScript CONFIG NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Quick           CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5QuickControls2  CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Svg             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Xml             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       STATUS                                     │
# └──────────────────────────────────────────────────────────────────┘

# ─── GLOBAL ────────
message(STATUS "------ ${QATERIALGALLERY_TARGET} Configuration ------")
message(STATUS "QATERIALGALLERY_BUILD_SHARED           : ${QATERIALGALLERY_BUILD_SHARED}")
message(STATUS "QATERIALGALLERY_BUILD_STATIC           : ${QATERIALGALLERY_BUILD_STATIC}")
message(STATUS "QATERIALGALLERY_VERSION                : ${QATERIALGALLERY_VERSION}")
message(STATUS "QATERIALGALLERY_VERSION_TAG_HEX        : ${QATERIALGALLERY_VERSION_TAG_HEX}")
message(STATUS "------ ${QATERIALGALLERY_TARGET} End Configuration ------")

# ────────── CHECK CONFLICT ──────────────────────────────────────────

if(QATERIALGALLERY_BUILD_SHARED AND QATERIALGALLERY_BUILD_STATIC)
    message(FATAL_ERROR "QaterialGallery can't compile shared and static library at the same time")
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

# spdlog
FetchContent_Declare(
    spdlog
    GIT_REPOSITORY ${SPDLOG_REPOSITORY}
    GIT_TAG        ${SPDLOG_TAG}
)

# Qaterial
set(QATERIAL_FOLDER_PREFIX "Dependencies" CACHE STRING "")
FetchContent_Declare(
  Qaterial
  GIT_REPOSITORY ${QATERIAL_REPOSITORY}
  GIT_TAG        ${QATERIAL_TAG}
  )

# Make all dependencies avaiables
FetchContent_MakeAvailable(Qaterial spdlog)
set_target_properties(spdlog PROPERTIES FOLDER "Dependencies")

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

file(GLOB_RECURSE QATERIALGALLERY_QML_SRCS qml/*.qml)

FOREACH(SOURCE IN ITEMS ${QATERIALGALLERY_QML_SRCS})
  GET_FILENAME_COMPONENT(SOURCE_PATH "${SOURCE}" PATH)
  FILE(RELATIVE_PATH SOURCE_PATH_REL ${CMAKE_CURRENT_SOURCE_DIR} "${SOURCE_PATH}")
  STRING(REPLACE "/" "\\" GROUP_PATH "${SOURCE_PATH_REL}")
  SOURCE_GROUP("Qml\\${GROUP_PATH}" FILES "${SOURCE}")
ENDFOREACH()

set(QATERIALGALLERY_SRCS
  # Main
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/include/QaterialGallery/QaterialGallery.hpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/QaterialGallery.cpp
  ${QATERIALGALLERY_QML_SRCS}
  )

# ┌──────────────────────────────────────────────────────────────────┐
# │                       TARGET                                     │
# └──────────────────────────────────────────────────────────────────┘

# ────────── QML TO CACHE ───────────

# Add qml to the qtquick compiler
qtquick_compiler_add_resources(QATERIALGALLERY_QML_RES ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery.qrc)
set(QATERIALGALLERY_SRCS ${QATERIALGALLERY_SRCS} ${QATERIALGALLERY_QML_RES})

# Trick to rerun cmake each time QaterialGallery.qrc is updated
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/QaterialGallery.qrc.junk
  )

# Dont Run Moc on cpp file generated from qml
FOREACH(CacheQml ${QATERIALGALLERY_QML_RES})
  SET_PROPERTY(SOURCE ${CacheQml} PROPERTY SKIP_AUTOMOC ON)
  SOURCE_GROUP("QtQuickCompiler Files" FILES ${CacheQml})
ENDFOREACH()

# ───── SHARED ──────────────

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

# ───── COMMON ──────────────

target_include_directories(${QATERIALGALLERY_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_MAJOR=${QATERIALGALLERY_VERSION_MAJOR})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_MINOR=${QATERIALGALLERY_VERSION_MINOR})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_PATCH=${QATERIALGALLERY_VERSION_PATCH})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_TAG=${QATERIALGALLERY_VERSION_TAG})
target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_VERSION_TAG_HEX=${QATERIALGALLERY_VERSION_TAG_HEX})

target_link_libraries(${QATERIALGALLERY_TARGET} Qaterial)

set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES AUTOMOC TRUE)
set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES AUTORCC TRUE)
target_compile_features(${QATERIALGALLERY_TARGET} PUBLIC cxx_std_11)
target_link_libraries(${QATERIALGALLERY_TARGET}
  Qt5::Core
  Qt5::Gui
  Qt5::Svg
  Qt5::Xml
  Qt5::Qml
  Qt5::Quick
  Qt5::QuickControls2
  )

if(TARGET Qt5::QmlWorkerScript)
  target_link_libraries(${QATERIALGALLERY_TARGET} Qt5::QmlWorkerScript)
endif()

# set output directories for all builds (Debug, Release, etc.)
foreach(_CONFIG ${CMAKE_CONFIGURATION_TYPES})
  string(TOUPPER ${_CONFIG} _CONFIG_UPPER)
  set_target_properties(${QATERIALGALLERY_TARGET}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_${_CONFIG_UPPER} "${PROJECT_BINARY_DIR}/${_CONFIG}/lib"
    LIBRARY_OUTPUT_DIRECTORY_${_CONFIG_UPPER} "${PROJECT_BINARY_DIR}/${_CONFIG}/lib"
    RUNTIME_OUTPUT_DIRECTORY_${_CONFIG_UPPER} "${PROJECT_BINARY_DIR}/${_CONFIG}/bin"
  )
endforeach()

# Correctly link to static qt
get_target_property(QT_TARGET_TYPE Qt5::Core TYPE)
if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
  FetchContent_MakeAvailable(QtStaticCMake)
  qt_generate_qml_plugin_import(${QATERIALGALLERY_TARGET}
    QML_SRC ${CMAKE_CURRENT_SOURCE_DIR}/qml
    EXTRA_PLUGIN
      QtQuickVirtualKeyboardPlugin
      QtQuickVirtualKeyboardSettingsPlugin
      QtQuickVirtualKeyboardStylesPlugin
      QmlFolderListModelPlugin
      QQuickLayoutsPlugin
    VERBOSE
    )
  qt_generate_plugin_import(${QATERIALGALLERY_TARGET} VERBOSE)
endif()

# ────────── POST BUILD PLATFORM DEPENDANCIES ─────────────

include(${CMAKE_CURRENT_SOURCE_DIR}/platform/PostBuildPlatform.cmake)