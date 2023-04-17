*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_swapix_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/two_factor_authentication_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Variables ***
${pix_key}    29476245808

*** Test Cases ***
min_amount
    Tap On Navigation Tab By Name    Pay
    Tap Element By Label    SWAPiX
    Input PIX Key    ${pix_key}
    Input Amount    2
    Verify Label Displays    Minimum 0.5 USDt
    
more_than_available
    Input Amount    25
    Verify Element Contains Text    minimum balance is needed to complete this payment.
    
valid_amount
    Input Amount    5
    Tap Pay Button
    Verify Label Displays    Two-Factor Authentication