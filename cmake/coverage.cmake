target_compile_options(${PROJECT_NAME}
PUBLIC
"-O0"
"-fprofile-arcs"
"--coverage"
)

set(GCDA_DIR ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}.dir)
message(${GCDA_DIR})
set(COVERAGE_DIR ${CMAKE_BINARY_DIR}/coverage)
add_custom_command(OUTPUT ${COVERAGE_DIR}/index.html
                   # create directories
                   COMMAND mkdir -p ${COVERAGE_DIR}
                   COMMAND mkdir -p ${COVERAGE_DIR}/aux
                   # generate coverage info and html to show
                   COMMAND lcov --no-external -d ${CMAKE_SOURCE_DIR}/src  --capture --directory ${GCDA_DIR} --output-file ${COVERAGE_DIR}/aux/cov.info
                   COMMAND genhtml ${COVERAGE_DIR}/aux/cov.info --output-directory ${COVERAGE_DIR}
                   # depends on gcda files that are created when running the tests
                   DEPENDS ${GCDA_DIR}/*.gcda)
add_custom_target(coverage DEPENDS ${COVERAGE_DIR}/index.html)
target_link_libraries(${PROJECT_NAME} gcov)