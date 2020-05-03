MESSAGE(STATUS "Post Build Platform Dependancies Configuration")

# ──── WINDOWS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

  if(NOT QATERIALGALLERY_BUILD_SHARED AND NOT QATERIALGALLERY_BUILD_STATIC)

    include(cmake/FetchQtWindowsCMake.cmake)

    # Don't deploy when using static cmake since we are not using any qml file
    get_target_property(QT_TARGET_TYPE Qt5::Core TYPE)
    if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
      set(PLATFORM_NO_DEPLOY NO_DEPLOY)
    endif()

    add_qt_windows_exe(${QATERIALGALLERY_TARGET}
      ALL
      NAME "Qaterial"
      VERSION ${QATERIAL_VERSION}
      PUBLISHER "OlivierLdff"
      PRODUCT_URL "https://github.com/OlivierLDff/QaterialGallery"
      PACKAGE "com.oliv.qaterial"
      ICON ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.ico
      ICON_RC ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc
      QML_DIR ${QT_WINDOWS_QT_ROOT}/qml
      NO_TRANSATION
      VERBOSE_LEVEL_DEPLOY 1
      VERBOSE_INSTALLER
      ${PLATFORM_NO_DEPLOY}
    )

    if(MSVC)
      set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${QATERIALGALLERY_TARGET})
    endif()

  endif()
endif()

# ──── LINUX ────

# ──── MACOS ────

# ──── ANDROID ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

  include(cmake/FetchQtAndroidCMake.cmake)

  # Set keystore variable
  # Should be set from cmake command line tool -DQATERIALGALLERY_ANDROID_KEYSTORE=...
  # -DQATERIALGALLERY_ANDROID_KEYSTORE_ALIAS=...
  # -DQATERIALGALLERY_ANDROID_KEYSTORE_PASSWORD=...
  if(QATERIALGALLERY_ANDROID_KEYSTORE)
    SET(KEYSTORE_SIGNATURE
      KEYSTORE ${QATERIALGALLERY_ANDROID_KEYSTORE} ${QATERIALGALLERY_ANDROID_KEYSTORE_ALIAS}
      KEYSTORE_PASSWORD ${QATERIALGALLERY_ANDROID_KEYSTORE_PASSWORD}
      )
  endif()

  add_qt_android_apk(${QATERIALGALLERY_TARGET}Apk ${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    VERSION_NAME ${QATERIAL_VERSION}
    VERSION_CODE 2 # Must be incremented on each release
    PACKAGE_NAME "com.oliv.qaterial"
    PACKAGE_SOURCES  ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/src
    ANDROID_MANIFEST_IN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/AndroidManifest.xml.in
    ${KEYSTORE_SIGNATURE}
    )

endif()

# ──── IOS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

  include(cmake/FetchQtIosCMake.cmake)

  # We can't have empty flags
  # Should be set from cmake -DTEAM_ID=...
  if(NOT TEAM_ID)
    message(WARNING "Please provide TEAM_ID to cmake (cmake -DTEAM_ID=AAAAAAAA <path>). You will need to fix that in xcode!!")
    SET(TEAM_ID "AAAAAAAA")
  endif(NOT TEAM_ID)

  add_qt_ios_app(${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    BUNDLE_IDENTIFIER "com.oliv.qaterial"
    VERSION ${QATERIAL_VERSION}
    LONG_VERSION ${QATERIAL_VERSION}.${QATERIAL_VERSION_TAG}
    CODE_SIGN_IDENTITY "iPhone Developer"
    TEAM_ID ${TEAM_ID} # TEAM_ID must be specified when executing cmake or later in XCode
    COPYRIGHT "Copyright Olivier Ldff 2019-2020"
    ASSET_DIR "${CMAKE_CURRENT_SOURCE_DIR}/platform/ios/Assets.xcassets"
    LAUNCHSCREEN_STORYBOARD "${CMAKE_CURRENT_SOURCE_DIR}/platform/ios/LaunchScreen.storyboard"
    MAIN_STORYBOARD "${CMAKE_CURRENT_SOURCE_DIR}/platform/ios/Main.storyboard"
    ORIENTATION_PORTRAIT
    ORIENTATION_PORTRAIT_UPDOWN
    ORIENTATION_LANDSCAPE_LEFT
    ORIENTATION_LANDSCAPE_RIGHT
    SUPPORT_IPHONE
    SUPPORT_IPAD
    VERBOSE
    )
endif()

# ──── WASM ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
  include(cmake/FetchQtWasmCMake.cmake)
  add_qt_wasm_app(${QATERIALGALLERY_TARGET} INITIAL_MEMORY 32MB)
endif()
