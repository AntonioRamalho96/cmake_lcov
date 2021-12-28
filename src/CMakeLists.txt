add_library(${PROJECT_NAME} my_code.cpp)
target_compile_options(${PROJECT_NAME}
PUBLIC
"-fPIC"
)
include(../cmake/coverage.cmake)