add_executable(simple_app simple_app.c)
target_link_libraries(simple_app simple_app_lib)
target_compile_features(simple_app PUBLIC c_std_99)
install(TARGETS simple_app)
