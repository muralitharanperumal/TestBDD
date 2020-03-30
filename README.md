This is an experimental code on how to use cucumber-cpp+Gherkin BDD framework to do functional testing on C++ shared library

The C++ shared library and header files are copied into ${CWD}/lib/mycalc/.

This also uses googletest as test framework and automatically downloads and builds as part of build process.

To build the test:
# ./setup.sh

To run the test
# cd build
# ./CalcTestSteps > /dev/null &
# cd ..
# cucumber 
