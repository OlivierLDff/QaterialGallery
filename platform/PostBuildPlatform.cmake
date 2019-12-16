MESSAGE(STATUS "Post Build Platform Dependancies Configuration")

# ───────── WINDOWS ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    IF(QATERIALGALLERY_BUILD_EXE)

        message(STATUS "Download QtWindowsCMake from ${QTWINDOWSCMAKE_REPOSITORY}")

        # QtWindowsCMake
        FetchContent_Declare(
            QtWindowsCMake
            GIT_REPOSITORY ${QTWINDOWSCMAKE_REPOSITORY}
            GIT_TAG        ${QTWINDOWSCMAKE_TAG}
        )
        FetchContent_MakeAvailable(QtWindowsCMake)

        add_qt_windows_exe( ${QATERIALGALLERY_TARGET}
            ALL
            NAME "QaterialGallery"
            VERSION ${QATERIALGALLERY_VERSION}
            PUBLISHER "OlivierLdff"
            PRODUCT_URL "https://github.com/OlivierLDff/QaterialGallery"
            PACKAGE "com.oliv.qaterial"
            ICON ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.ico
            ICON_RC ${CMAKE_CURRENT_SOURCE_DIR}/platform/windows/icon.rc
            QML_DIR ${QT_WINDOWS_QT_ROOT}/qml
            NO_TRANSATION
            VERBOSE_LEVEL_DEPLOY 1
            VERBOSE_INSTALLER
         )

        if(MSVC)
            set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${QATERIALGALLERY_TARGET})
        endif() # MSVC

    endif() # QATERIALGALLERY_BUILD_EXE
endif() # Windows

# ────────── LINUX ───────────

# ────────── MACOS ───────────

# ───────── ANDROID ──────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Android")

    # QtAndroidCMake
    FetchContent_Declare(
        QtAndroidCMake
        GIT_REPOSITORY ${QTANDROIDCMAKE_REPOSITORY}
        GIT_TAG        ${QTANDROIDCMAKE_TAG}
    )
    message(STATUS "Download QtAndroidCMake from ${QTANDROIDCMAKE_REPOSITORY}")
    FetchContent_MakeAvailable(QtAndroidCMake)

    # Set keystore variable
    IF(QATERIALGALLERY_ANDROID_KEYSTORE)
    SET(KEYSTORE_SIGNATURE
        KEYSTORE ${QATERIALGALLERY_ANDROID_KEYSTORE} ${QATERIALGALLERY_ANDROID_KEYSTORE_ALIAS}
        KEYSTORE_PASSWORD ${QATERIALGALLERY_ANDROID_KEYSTORE_PASSWORD}
        )
    ENDIF(QATERIALGALLERY_ANDROID_KEYSTORE)

    add_qt_android_apk(${QATERIALGALLERY_TARGET}Apk ${QATERIALGALLERY_TARGET}
        NAME "Qaterial"
        VERSION_NAME ${QATERIALGALLERY_VERSION}
        VERSION_CODE 1 # Must be incremented on each release
        PACKAGE_NAME "com.oliv.qaterial"
        PACKAGE_SOURCES  ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/src
        ANDROID_MANIFEST_IN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/platform/android/AndroidManifest.xml.in
        ${KEYSTORE_SIGNATURE}
    )

ENDIF() # Android

# ─────────── IOS ────────────

IF(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")

    # QtIosCMake
    FetchContent_Declare(
        QtIosCMake
        GIT_REPOSITORY ${QTIOSCMAKE_REPOSITORY}
        GIT_TAG        ${QTIOSCMAKE_TAG}
    )
    message(STATUS "Download QtIosCMake from ${QTIOSCMAKE_REPOSITORY}")
    FetchContent_MakeAvailable(QtIosCMake)

    # We can't have empty flags
    IF(NOT TEAM_ID)
        SET(TEAM_ID "AAAAAAAA")
    ENDIF(NOT TEAM_ID)

    add_qt_ios_app(${QATERIALGALLERY_TARGET}
        NAME "Qaterial"
        BUNDLE_IDENTIFIER "com.oliv.qaterial"
        VERSION ${QATERIALGALLERY_VERSION}
        LONG_VERSION ${QATERIALGALLERY_VERSION}.${QATERIALGALLERY_VERSION_TAG}
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


