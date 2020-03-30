cmake_minimum_required(VERSION 3.1...3.15)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
   cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
else()
   cmake_policy(VERSION 3.15)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
set(CMAKE_CXX_STANDARD 11)

project(MyTestCalc VERSION 1.0
                   DESCRIPTION "A Simple Calculator"
                   LANGUAGES CXX)

add_subdirectory(lib/googletest)

set(CORE_BOOST_LIBS thread system regex date_time program_options filesystem)
find_package(Boost COMPONENTS ${CORE_BOOST_LIBS})

if(Boost_FOUND)
  message("Boost is FOUND")
endif()

ADD_LIBRARY(mycalc SHARED IMPORTED)
SET_TARGET_PROPERTIES(mycalc PROPERTIES
    IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/lib/mycalc/libcalc.so
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/lib/mycalc/include")

ADD_LIBRARY(cucumber-cpp STATIC IMPORTED)
SET_TARGET_PROPERTIES(cucumber-cpp PROPERTIES
    IMPORTED_LOCATION /home/murali/cucumber-cpp/build/src/libcucumber-cpp.a
    INTERFACE_INCLUDE_DIRECTORIES "/home/murali/cucumber-cpp/include;/home/murali/cucumber-cpp/build/src/"
    INTERFACE_LINK_LIBRARIES "${Boost_LIBRARIES}")

enable_testing()

add_executable(CalcTestSteps features/step_definitions/CalcTestSteps)
target_link_libraries(CalcTestSteps PUBLIC mycalc gtest Boost::system Boost::regex cucumber-cpp)
