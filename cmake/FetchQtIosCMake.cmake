include(FetchContent)

set(QTIOSCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtIosCMake.git" CACHE STRING "QtIosCMake repository, can be a local URL")
set(QTIOSCMAKE_TAG master CACHE STRING "QtIosCMake git tag")

FetchContent_Declare(
  QtIosCMake
  GIT_REPOSITORY ${QTIOSCMAKE_REPOSITORY}
  GIT_TAG        ${QTIOSCMAKE_TAG}
)

FetchContent_MakeAvailable(QtIosCMake)