include(FetchContent)

set(QTANDROIDCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtAndroidCMake.git" CACHE STRING "Repository of QtAndroidCMake")
set(QTANDROIDCMAKE_TAG "master" CACHE STRING "Git Tag of QtAndroidCMake")

FetchContent_Declare(
  QtAndroidCMake
  GIT_REPOSITORY ${QTANDROIDCMAKE_REPOSITORY}
  GIT_TAG        ${QTANDROIDCMAKE_TAG}
)

FetchContent_MakeAvailable(QtAndroidCMake)