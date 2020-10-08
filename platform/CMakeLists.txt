MESSAGE(STATUS "Platform deploy to ${CMAKE_SYSTEM_NAME}")

# Correctly link to static qt
get_target_property(QT_TARGET_TYPE Qt5::Core TYPE)
if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtStaticCMake.cmake)
  qt_generate_qml_plugin_import(${QATERIALGALLERY_TARGET}
    QML_SRC ${PROJECT_SOURCE_DIR}/qml
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

# ──── WINDOWS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

  if(NOT QATERIALGALLERY_BUILD_SHARED AND NOT QATERIALGALLERY_BUILD_STATIC)

    include(${PROJECT_SOURCE_DIR}/cmake/FetchQtWindowsCMake.cmake)

    # Don't deploy when using static cmake since we are not using any qml file
    if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
      set(PLATFORM_NO_DEPLOY NO_DEPLOY)
    endif()

    add_qt_windows_exe(${QATERIALGALLERY_TARGET}
      NAME "Qaterial"
      PUBLISHER "Qaterial"
      PRODUCT_URL "https://github.com/OlivierLDff/QaterialGallery"
      PACKAGE "com.qaterial.gallery"
      ICON ${CMAKE_CURRENT_SOURCE_DIR}/windows/icon.ico
      ICON_RC ${CMAKE_CURRENT_SOURCE_DIR}/windows/icon.rc
      QML_DIR ${CMAKE_CURRENT_SOURCE_DIR}/windows
      NO_TRANSATION
      VERBOSE_LEVEL_DEPLOY 1
      VERBOSE_INSTALLER
      ${PLATFORM_NO_DEPLOY}
    )

    if(MSVC)
      set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${QATERIALGALLERY_TARGET})
    endif()

    if(QATERIALGALLERY_DISCARD_ENV_PATH)
      message("The executable will discard every ")
      target_compile_definitions(${QATERIALGALLERY_TARGET} PRIVATE -DQATERIALGALLERY_DISCARD_ENV_PATH)
      target_sources(${QATERIALGALLERY_TARGET} PRIVATE windows/QtConf.qrc)
    endif()

  endif()
endif()

# ──── LINUX ────

# ──── MACOS ────

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
      )
  endif()

  add_qt_android_apk(${QATERIALGALLERY_TARGET}Apk ${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    VERSION_NAME ${QATERIAL_VERSION}
    VERSION_CODE 3 # Must be incremented on each release
    PACKAGE_NAME "com.qaterial.gallery"
    PACKAGE_SOURCES  ${CMAKE_CURRENT_SOURCE_DIR}/android
    ${KEYSTORE_SIGNATURE}
    )

endif()

# ──── IOS ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtIosCMake.cmake)

  # We can't have empty flags
  # Should be set from cmake -DTEAM_ID=...
  if(NOT TEAM_ID)
    message(WARNING "Please provide TEAM_ID to cmake (cmake -DTEAM_ID=AAAAAAAA <path>). You will need to fix that in xcode!!")
    SET(TEAM_ID "AAAAAAAA")
  endif(NOT TEAM_ID)

  add_qt_ios_app(${QATERIALGALLERY_TARGET}
    NAME "Qaterial"
    BUNDLE_IDENTIFIER "com.qaterial.gallery"
    VERSION ${QATERIAL_VERSION}
    LONG_VERSION ${QATERIAL_VERSION}.${QATERIAL_VERSION_TAG}
    CODE_SIGN_IDENTITY "iPhone Developer"
    TEAM_ID ${TEAM_ID} # TEAM_ID must be specified when executing cmake or later in XCode
    COPYRIGHT "Copyright Olivier Ldff 2019-2020"
    ASSET_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ios/Assets.xcassets"
    LAUNCHSCREEN_STORYBOARD "${CMAKE_CURRENT_SOURCE_DIR}/ios/LaunchScreen.storyboard"
    MAIN_STORYBOARD "${CMAKE_CURRENT_SOURCE_DIR}/ios/Main.storyboard"
    ORIENTATION_PORTRAIT
    ORIENTATION_PORTRAIT_UPDOWN
    ORIENTATION_LANDSCAPE_LEFT
    ORIENTATION_LANDSCAPE_RIGHT
    VERBOSE
    )
endif()

# ──── WASM ────

if(${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
  include(${PROJECT_SOURCE_DIR}/cmake/FetchQtWasmCMake.cmake)
  add_qt_wasm_app(${QATERIALGALLERY_TARGET} INITIAL_MEMORY 32MB)
endif()
