message(STATUS "Pre Build Platform Dependancies Configuration")
message(STATUS "CMAKE_SYSTEM_NAME :         ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_HOST_SYSTEM_NAME :    ${CMAKE_HOST_SYSTEM_NAME}")

# ───────── WINDOWS ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

    set(QATERIALGALLERY_PLATFORM_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc")
    set(QATERIALGALLERY_PLATFORM_TARGET WIN32)

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

# ────────── LINUX ───────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

# ────────── MACOS ───────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

# ───────── ANDROID ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

    set(QATERIALGALLERY_BUILD_SHARED ON CACHE BOOL "Build as a shared library" FORCE)
    set(QATERIALGALLERY_BUILD_STATIC OFF CACHE BOOL "Build as a static library" FORCE)

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

# ─────────── IOS ────────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")