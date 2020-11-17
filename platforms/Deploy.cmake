MESSAGE(STATUS "Platform deploy to ${CMAKE_SYSTEM_NAME}")

set(QATERIALGALLERY_PLATFORMS_DIR ${PROJECT_SOURCE_DIR}/platforms)

# Correctly link to static qt
get_target_property(QT_TARGET_TYPE Qt5::Core TYPE)
if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtStaticCMake.cmake)
  qt_generate_qml_plugin_import(${QATERIALGALLERY_TARGET} QML_SRC ${PROJECT_SOURCE_DIR}/qml VERBOSE)
  qt_generate_plugin_import(${QATERIALGALLERY_TARGET} VERBOSE)
endif()

# ──── WINDOWS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

  if(NOT QATERIALGALLERY_BUILD_SHARED AND NOT QATERIALGALLERY_BUILD_STATIC)

    # set output directories for all builds (Debug, Release, etc.)
    set_target_properties(${QATERIALGALLERY_TARGET}
      PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>_Artifact"
      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>_Artifact"
      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>"
      )

    include(${PROJECT_SOURCE_DIR}/cmake/FetchQtWindowsCMake.cmake)

    # Don't deploy when using static cmake since we are not using any qml file
    if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
      set(PLATFORM_NO_DEPLOY NO_DEPLOY)
    endif()

    add_qt_windows_exe(${QATERIALGALLERY_TARGET}
      NAME "Qaterial Gallery"
      PUBLISHER "Qaterial"
      PRODUCT_URL "https://github.com/OlivierLDff/QaterialGallery"
      PACKAGE "com.qaterial.gallery"
      ICON ${QATERIALGALLERY_PLATFORMS_DIR}/windows/icon.ico
      ICON_RC ${QATERIALGALLERY_PLATFORMS_DIR}/windows/icon.rc
      QML_DIR ${PROJECT_SOURCE_DIR}/qml
      NO_TRANSLATIONS
      VERBOSE_LEVEL_DEPLOY 1
      VERBOSE_INSTALLER
      ${PLATFORM_NO_DEPLOY}
    )

    if(MSVC)
      set_property(DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${QATERIALGALLERY_TARGET})
    endif()

  endif()
endif()

# ──── LINUX ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

  if(NOT QATERIALGALLERY_BUILD_SHARED AND NOT QATERIALGALLERY_BUILD_STATIC)

    # set output directories for all builds (Debug, Release, etc.)
    set_target_properties(${QATERIALGALLERY_TARGET}
      PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>_Artifact"
      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>_Artifact"
      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>"
      )

    include(${PROJECT_SOURCE_DIR}/cmake/FetchQtLinuxCMake.cmake)

    if(NOT QATERIALGALLERY_IGNORE_ENV)
      set(QATERIALGALLERY_ALLOW_ENVIRONMENT_VARIABLE "ALLOW_ENVIRONMENT_VARIABLE")
    endif()

    add_qt_linux_appimage(${QATERIALGALLERY_TARGET}
      APP_DIR ${QATERIALGALLERY_PLATFORMS_DIR}/linux/AppDir
      QML_DIR ${PROJECT_SOURCE_DIR}/qml
      NO_TRANSLATIONS
      ${QATERIALGALLERY_ALLOW_ENVIRONMENT_VARIABLE}
      VERBOSE_LEVEL 1
    )

  endif()

endif()

# ──── MACOS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtMacCMake.cmake)

  add_qt_mac_app(${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    BUNDLE_IDENTIFIER "com.qaterial.gallery"
    LONG_VERSION ${QATERIALGALLERY_VERSION}.${QATERIALGALLERY_VERSION_TAG}
    COPYRIGHT "Copyright Olivier Le Doeuff 2019-2020"
    APPLICATION_CATEGORY_TYPE "public.app-category.developer-tools"
    QML_DIR ${PROJECT_SOURCE_DIR}/qml
    RESOURCES
      "${QATERIALGALLERY_PLATFORMS_DIR}/macos/Assets.xcassets"
    DMG
    PKG
    # PKG_UPLOAD_SYMBOLS
    VERBOSE
    VERBOSE_LEVEL 3
  )

endif()

# ──── ANDROID ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtAndroidCMake.cmake)

  # Set keystore variable
  # Should be set from cmake command line tool -DQATERIALGALLERY_ANDROID_KEYSTORE=...
  # -DQATERIALGALLERY_ANDROID_KEYSTORE_ALIAS=...
  # -DQATERIALGALLERY_ANDROID_KEYSTORE_PASSWORD=...
  if(QATERIALGALLERY_ANDROID_KEYSTORE)
    SET(KEYSTORE_SIGNATURE
      KEYSTORE ${QATERIALGALLERY_ANDROID_KEYSTORE} ${QATERIALGALLERY_ANDROID_KEYSTORE_ALIAS}
      KEYSTORE_PASSWORD ${QATERIALGALLERY_ANDROID_KEYSTORE_PASSWORD}
      KEY_PASSWORD ${QATERIALGALLERY_ANDROID_KEY_PASSWORD}
      KEY_ALIAS ${QATERIALGALLERY_ANDROID_ALIAS}
      )
  endif()

  add_qt_android_apk(${QATERIALGALLERY_TARGET}Apk ${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    VERSION_CODE 3 # Must be incremented on each release
    PACKAGE_NAME "com.qaterial.gallery"
    PACKAGE_SOURCES  ${QATERIALGALLERY_PLATFORMS_DIR}/android
    ${KEYSTORE_SIGNATURE}
    QML_DIR ${PROJECT_SOURCE_DIR}/qml
  )

endif()

# ──── IOS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtIosCMake.cmake)

  add_qt_ios_app(${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    BUNDLE_IDENTIFIER "com.qaterial.gallery"
    LONG_VERSION ${QATERIALGALLERY_VERSION}.${QATERIALGALLERY_VERSION_TAG}
    COPYRIGHT "Copyright Olivier Le Doeuff 2019-2020"
    ASSET_DIR "${QATERIALGALLERY_PLATFORMS_DIR}/ios/Assets.xcassets"
    LAUNCHSCREEN_STORYBOARD "${QATERIALGALLERY_PLATFORMS_DIR}/ios/LaunchScreen.storyboard"
    ORIENTATION_PORTRAIT
    ORIENTATION_PORTRAIT_UPDOWN
    ORIENTATION_LANDSCAPE_LEFT
    ORIENTATION_LANDSCAPE_RIGHT
    IPA
    UPLOAD_SYMBOL
    VERBOSE
  )
endif()

# ──── WASM ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtWasmCMake.cmake)
  add_qt_wasm_app(${QATERIALGALLERY_TARGET} INITIAL_MEMORY 32MB)
endif()
