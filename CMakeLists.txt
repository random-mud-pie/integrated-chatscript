# copyright Talmai Oliveira <to@talm.ai>

cmake_minimum_required(VERSION 3.13)
set(CMAKE_CXX_STANDARD 14)
project(chatscriptPOC VERSION 1.0)

set(DOWNLOAD_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/downloads"
    CACHE PATH "Location where external projects will be downloaded."
)

# color variables
string(ASCII 27 Esc)
set(ColorReset "${Esc}[m")
set(BoldRed "${Esc}[1;31m")

add_compile_options(-Wall -Werror -Wpedantic)
if (CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-parameter -Wno-shadow -finput-charset=UTF-16")
endif ()

# CMAKE_MODULE_PATH: list of directories specifying a search path for CMake modules
# to be loaded by the include() or find_package() commands before checking the
# default modules that come with CMake. By default it is empty, it is intended to be set by the project.
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/deps;${CMAKE_MODULE_PATH})

include(ExternalProject)
include(chatscript)

include_directories(
    BEFORE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

add_executable(
    example
    src/example.cxx
)

add_dependencies(
    example
    chatscript_target
)
