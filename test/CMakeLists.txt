add_executable(my_test my_test.cpp)
target_link_libraries(my_test ${PROJECT_NAME})
add_test(NAME my_test_ COMMAND my_test)