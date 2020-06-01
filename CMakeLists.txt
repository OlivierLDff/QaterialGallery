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
set(QATERIALGALLERY_TARGET ${QATERIALGALLERY_PROJECT} CACHE STRING "Qaterial Gallery Target Name")
set(QATERIALGALLERY_BUILD_SHARED OFF CACHE BOOL "Build as a shared library")
set(QATERIALGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library")

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

# ──── PRE BUILD PLATFORM DEPENDANCIES ────

include(platform/PreBuildPlatform.cmake)

# ┌──────────────────────────────────────────────────────────────────┐
# │                         QT5 CMAKE                                │
# └──────────────────────────────────────────────────────────────────┘

find_package(Qt5Core            CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Gui             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Qml             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5QmlWorkerScript CONFIG QUIET    NO_CMAKE_SYSTEM_PATH) # Only from qt5.14
find_package(Qt5Quick           CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5QuickControls2  CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Svg             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5Xml             CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)
find_package(Qt5QuickCompiler   CONFIG REQUIRED NO_CMAKE_SYSTEM_PATH)

# ┌──────────────────────────────────────────────────────────────────┐
# │                       STATUS                                     │
# └──────────────────────────────────────────────────────────────────┘

# ─── GLOBAL ────

message(STATUS "------ ${QATERIALGALLERY_TARGET} v${QATERIALGALLERY_VERSION} Configuration ------")
message(STATUS "QATERIALGALLERY_BUILD_SHARED           : ${QATERIALGALLERY_BUILD_SHARED}")
message(STATUS "QATERIALGALLERY_BUILD_STATIC           : ${QATERIALGALLERY_BUILD_STATIC}")
message(STATUS "------ ${QATERIALGALLERY_TARGET} End Configuration ------")

# ──── CHECK CONFLICT ────

if(QATERIALGALLERY_BUILD_SHARED AND QATERIALGALLERY_BUILD_STATIC)
    message(FATAL_ERROR "QaterialGallery can't compile shared and static library at the same time")
endif()

# ┌──────────────────────────────────────────────────────────────────┐
# │                       SOURCES                                    │
# └──────────────────────────────────────────────────────────────────┘

qtquick_compiler_add_resources(QATERIALGALLERY_QML_RES ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery.qrc)
file(GLOB_RECURSE QATERIALGALLERY_QML_SRCS qml/*.qml)
source_group("Qml" FILES "${QATERIALGALLERY_QML_SRCS}")

set(QATERIALGALLERY_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Main.cpp
  ${QATERIALGALLERY_QML_RES}
  # QATERIALGALLERY_QML_SRCS is optionnal, it's only for them to show in visual studio or xcode
  ${QATERIALGALLERY_QML_SRCS}
  ${QATERIALGALLERY_PLATFORM_SRCS}
  )

# Trick to rerun cmake each time QaterialGallery.qrc is updated
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/qml/QaterialGallery.qrc
  ${CMAKE_CURRENT_BINARY_DIR}/QaterialGallery.qrc.junk
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

# ──── QT ────

set_target_properties(${QATERIALGALLERY_TARGET} PROPERTIES AUTOMOC TRUE AUTORCC TRUE)
target_link_libraries(${QATERIALGALLERY_TARGET} PRIVATE
  Qt5::Core
  Qt5::Gui
  Qt5::Svg
  Qt5::Xml
  Qt5::Qml
  Qt5::Quick
  Qt5::QuickControls2
  )

# Correctly link to static qt
get_target_property(QT_TARGET_TYPE Qt5::Core TYPE)
if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
  include(cmake/FetchQtStaticCMake.cmake)
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

if(TARGET Qt5::QmlWorkerScript)
  target_link_libraries(${QATERIALGALLERY_TARGET} PRIVATE Qt5::QmlWorkerScript)
endif()

# ──── OTHER DEPENDENCIES ────

include(cmake/FetchSpdlog.cmake)
include(cmake/FetchQaterial.cmake)

target_link_libraries(${QATERIALGALLERY_TARGET} PRIVATE
  Qaterial
  spdlog
  )

# ────────── POST BUILD PLATFORM DEPENDANCIES ─────────────

include(platform/PostBuildPlatform.cmake)