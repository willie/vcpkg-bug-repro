cmake_minimum_required(VERSION 3.22.1)
project(helloworld)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "vcpkg toolchain file")
message(STATUS "using toolchain file: ${CMAKE_TOOLCHAIN_FILE}")

add_executable(${CMAKE_PROJECT_NAME} main.cpp)
target_compile_features(${CMAKE_PROJECT_NAME} PRIVATE cxx_std_17)

find_package(Python3 COMPONENTS Development REQUIRED)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE Python3::Python)
