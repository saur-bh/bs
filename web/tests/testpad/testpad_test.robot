*** Settings ***
Resource    ../../resources/init.robot
Resource    ../../keywords/testpad/testpad_common_keywords.robot
Resource    ../../keywords/testpad/script_keywords.robot

*** Variables ***
${version}    6.0

*** Test Cases ***
testpad_mobile_test
    Open Browser With Option    https://ontestpad.com/login
    Login Testpad    vuong.van@bitfinex.com    3A@bkdn0707180499
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/2737#//    vuong.van@bitfinex.com
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/2742#//    saurabh.verma@bitfinex.com
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/2739#//    vuong.van@bitfinex.com
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/2939#3//    vuong.van@bitfinex.com
    Create Test Pad Test Run    https://bitfinex.testpad.com/script/3128#45/3/    vuong.van@bitfinex.com

*** Keywords ***
Create Test Pad Test Run
    [Arguments]    ${url_to_test}    ${tester}    ${build}=${version}
    Go To Url    ${url_to_test}
    Click Create New Test Run Button
    Click I Really Do Want A New Test Button
    Submit Test Run Details    ${tester}    ${build}    ${tester}