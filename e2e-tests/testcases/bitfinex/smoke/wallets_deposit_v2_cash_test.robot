*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_funds_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
cash
    Tap On Navigation Tab By Name    Wallets
    Tap Element By Label    Deposit
    Tap Element By Label    Cash
    Input Text To Textbox    USD
    Tap Element By Label    US Dollar
    Input Bank Wire Deposit Amount    9999
    Verify Label Displays    Amount must be greater than or equal to 10000.
    Input Bank Wire Deposit Amount    10000
    Tap Element By Label    Continue
    Tap Element By Label    Done
    Verify Label Displays    Recent Deposits
    Tap Element By Label    Created
    Tap Element By Label    Cancel
    Verify Label Displays    Pending cancellation
    Tap On Back Button
    Clear Search Text Box