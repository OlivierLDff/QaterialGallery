include(FetchContent)

set(QATERIAL_REPOSITORY "https://github.com/OlivierLDff/Qaterial.git" CACHE STRING "Repository of Qaterial")
set(QATERIAL_TAG "master" CACHE STRING "Git Tag of Qaterial")

FetchContent_Declare(
  qaterial
  GIT_REPOSITORY ${QATERIAL_REPOSITORY}
  GIT_TAG        ${QATERIAL_TAG}
)

set(QATERIAL_FOLDER_PREFIX "Dependencies" CACHE STRING "")
FetchContent_MakeAvailable(qaterial)