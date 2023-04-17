*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
funding
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Input Rate Per Day    1
    Tap Min Period On Funding
    Tap Max Offer On Funding
    Verify Max Offer Populated On Funding    2s
    Put App In Background    10
    Tap Max Offer On Funding
    Verify Max Offer Populated On Funding    2s