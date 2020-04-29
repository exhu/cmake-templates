cmake_minimum_required(VERSION 3.17)
project(simple_app_test)

set(TESTS test1
    test2
)

foreach(T ${TESTS})
    add_executable(${T} ${T}.c)
    target_link_libraries(${T} simple_app_lib)
    target_compile_features(${T} PUBLIC c_std_99)
    add_test(NAME ${T} COMMAND "${T}")
endforeach()
