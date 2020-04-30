#cmake_minimum_required(VERSION 3.17)
#project(simple_app_lib)

set(SOURCES simple_app_lib.c
    simple_app_lib.h
)

add_library(simple_app_lib ${SOURCES})
target_include_directories(simple_app_lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_features(simple_app_lib PUBLIC c_std_99)