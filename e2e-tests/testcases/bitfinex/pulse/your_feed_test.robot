*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
search_pulse_user
    Access Bitfinex Pulse
    Tap Element By Label    Your Feed
    Tap Element By Accessibility Id    ${btn_pulse_search}
    Tap Element By Label    Users
    Input Text Into Element  ${text_pulse_search}  Automation  clear_text=${True}
    Verify Element Text Should Be    ${search_result}   Results 


