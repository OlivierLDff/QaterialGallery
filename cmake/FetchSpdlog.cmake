include(FetchContent)

set(SPDLOG_REPOSITORY "https://github.com/gabime/spdlog" CACHE STRING "Repository of spdlog")
set(SPDLOG_TAG "v1.x" CACHE STRING "Git tag/branch of spdlog")

FetchContent_Declare(
  spdlog
  GIT_REPOSITORY ${SPDLOG_REPOSITORY}
  GIT_TAG        ${SPDLOG_TAG}
  GIT_SHALLOW    1
)

FetchContent_MakeAvailable(spdlog)
set_target_properties(spdlog PROPERTIES FOLDER "Dependencies")