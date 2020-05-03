message(STATUS "Pre Build Platform Dependancies Configuration")
message(STATUS "CMAKE_SYSTEM_NAME :         ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_HOST_SYSTEM_NAME :    ${CMAKE_HOST_SYSTEM_NAME}")

# ───────── WINDOWS ──────────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

  if(NOT QATERIALGALLERY_BUILD_SHARED AND NOT QATERIALGALLERY_BUILD_STATIC)
    set(QATERIALGALLERY_PLATFORM_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc")
    set(QATERIALGALLERY_PLATFORM_TARGET WIN32)
  endif()

endif()

# ────────── LINUX ───────────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

endif()

# ────────── MACOS ───────────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

endif()

# ───────── ANDROID ──────────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

  set(QATERIALGALLERY_BUILD_SHARED ON CACHE BOOL "Build as a shared library" FORCE)

endif()

# ─────────── IOS ────────────

if(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

endif()