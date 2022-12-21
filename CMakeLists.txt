cmake_minimum_required(VERSION 3.22)

project(calc)

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

flex_target(lexer src/lexer.l lexer.yy.c)
bison_target(parser src/parser.y parser.tab.c)

add_executable(${PROJECT_NAME}
    ${FLEX_lexer_OUTPUTS}
    ${BISON_parser_OUTPUTS}
    src/main.c
)

target_link_libraries(${PROJECT_NAME} PUBLIC m)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_BINARY_DIR} src)
