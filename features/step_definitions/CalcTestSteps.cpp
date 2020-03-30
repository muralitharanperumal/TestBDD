#include <gtest/gtest.h>
#include <cucumber-cpp/autodetect.hpp>

#include "calc.hpp"

using cucumber::ScenarioScope;

struct CalcCtx {
    MyCalc *myCalc;
    double result;
};

GIVEN("^Created a MyCalc obj$") {
    ScenarioScope<CalcCtx> context;
    context->myCalc = new MyCalc();
}

WHEN("^Called add on that MyCalc obj$") {
    ScenarioScope<CalcCtx> context;
    context->result = context->myCalc->add(3,4);
}

THEN("^The result should be (.*) on the screen$") {
    REGEX_PARAM(int, expected);
    ScenarioScope<CalcCtx> context;

    EXPECT_EQ(expected, context->result);

    delete context->myCalc;
}
