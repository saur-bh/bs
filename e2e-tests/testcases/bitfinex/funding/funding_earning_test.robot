*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
funding_earning
    Tap On Navigation Tab By Name    Funding
    Scroll To Element By Label    PROVIDED    0.2    swipe=DOWN
    Verify Today Earnings Equivalent    USD    $
    Tap Element By Label    USD
    Verify Label Displays    FUNDING EARNINGS