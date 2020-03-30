#language: en
Feature: Addition
  I want to be told the sum of two numbers

Scenario: Add two number using mycalc
    Given Created a MyCalc obj
    When Called add on that MyCalc obj
    Then The result should be 7 on the screen


 
