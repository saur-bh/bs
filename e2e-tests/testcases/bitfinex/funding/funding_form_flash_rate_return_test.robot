*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
frr_delta_variable
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.001    150    120    BID    frr_delta_variable=${True}    confirm=${False}
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    FRR Delta Var Bid at 0.001%, for 150 USD, for 120 days.
    Tap Element By Label    Cancel
    Create Funding    -0.001    150    120    BID    confirm=${False}
    Verify Label Contain Text Not Display    Please confirm the following order
    
frr_delta_fixed
    Tap On Back Button
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.001    150    120    BID    frr_delta_fixed=${True}    confirm=${False}
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    FRR Delta Fix Bid at 0.001%, for 150 USD, for 120 days.
    Tap Element By Label    Cancel
    Create Funding    -0.001    150    120    BID    confirm=${False}
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    FRR Delta Fix Bid at -0.001%, for 150 USD, for 120 days.
    Tap Element By Label    Cancel
    
frr
    Tap On Back Button
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    ${None}    150    120    BID    frr=${True}    confirm=${False}
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    Bid at FRR, for 150 USD, for 120 days.
    Tap Element By Label    Cancel