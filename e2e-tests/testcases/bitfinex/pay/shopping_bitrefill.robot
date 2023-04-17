*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
labels_display
    Tap On Navigation Tab By Name    Pay
    Tap Element By Label    Shopping
    Verify Label Displays    Available
    Verify Label Displays    My Wallet
    Verify Label Displays    Spend in 24h
    Verify Element Contains Text    $0
    Verify Element Contains Text    0 BTC