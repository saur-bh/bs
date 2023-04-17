*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
confirm_funding_modal
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.013784    0.00000001    120    bid    confirm=${False}
    Verify Element Contains Text    for 0.00000001 USD, for 120 days.