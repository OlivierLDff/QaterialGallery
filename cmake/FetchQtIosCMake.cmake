include(FetchContent)

set(QQTIOSCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtIosCMake.git" CACHE STRING "QtIosCMake repository, can be a local URL")
set(QQTIOSCMAKE_TAG master CACHE STRING "QtIosCMake git tag")

FetchContent_Declare(
  QtIosCMake
  GIT_REPOSITORY ${QQTIOSCMAKE_REPOSITORY}
  GIT_TAG        ${QQTIOSCMAKE_TAG}
)

FetchContent_MakeAvailable(QtIosCMake)