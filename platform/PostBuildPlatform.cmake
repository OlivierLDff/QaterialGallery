MESSAGE(STATUS "Post Build Platform Dependancies Configuration")

# ───────── WINDOWS ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    IF(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)

        MESSAGE(STATUS "Add QtWindowsCMake for ${QQUICKMATERIALHELPERGALLERY_TARGET}")
        add_qt_windows_exe( ${QQUICKMATERIALHELPERGALLERY_TARGET} 
            ALL
            NAME "QQuickMaterialHelperGallery"
            VERSION ${QQUICKMATERIALHELPERGALLERY_VERSION}
            PUBLISHER "OlivierLdff"
            PRODUCT_URL "www.materialGallery.com"
            PACKAGE "com.oliv.materialGallery"
            ICON ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.ico
            ICON_RC ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc
            QML_DIR ${QT_WINDOWS_QT_ROOT}/qml
            NO_TRANSATION
            VERBOSE_LEVEL_DEPLOY 1
            VERBOSE_INSTALLER
         )

    ENDIF(QQUICKMATERIALHELPERGALLERY_BUILD_EXE)
ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

# ────────── LINUX ───────────

# ────────── MACOS ───────────

# ───────── ANDROID ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

    # Set keystore variable
    IF(QQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE)
    SET(KEYSTORE_SIGNATURE
        KEYSTORE ${QQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE} ${QQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_ALIAS}
        KEYSTORE_PASSWORD ${QQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE_PASSWORD}
        )
    ENDIF(QQUICKMATERIALHELPERGALLERY_ANDROID_KEYSTORE)

    add_qt_android_apk(${QQUICKMATERIALHELPERGALLERY_TARGET}Apk ${QQUICKMATERIALHELPERGALLERY_TARGET}
        NAME "QQuickMaterialHelperGallery"
        VERSION_NAME ${QQUICKMATERIALHELPERGALLERY_VERSION}
        VERSION_CODE 1 # Must be incremented on each release
        PACKAGE_NAME "com.oliv.materialGallery"
        PACKAGE_SOURCES  ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/src
        ANDROID_MANIFEST_IN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/AndroidManifest.xml.in
        ${KEYSTORE_SIGNATURE}
    )

ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

# ─────────── IOS ────────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

    # We can't have empty flags
    IF(NOT TEAM_ID)
        SET(TEAM_ID "AAAAAAAA")
    ENDIF(NOT TEAM_ID)

    add_qt_ios_app(${QQUICKMATERIALHELPERGALLERY_TARGET}
        NAME "Qml Material Helper Gallery"
        BUNDLE_IDENTIFIER "com.oliv.materialGallery"
        VERSION ${QQUICKMATERIALHELPERGALLERY_VERSION}
        LONG_VERSION ${QQUICKMATERIALHELPERGALLERY_VERSION}.${QQUICKMATERIALHELPERGALLERY_VERSION_TAG}
        CODE_SIGN_IDENTITY "iPhone Developer"
        TEAM_ID ${TEAM_ID} # TEAM_ID must be specified when executing cmake or later in XCode
        COPYRIGHT "Copyright Olivier Ldff 2019"
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
ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")


