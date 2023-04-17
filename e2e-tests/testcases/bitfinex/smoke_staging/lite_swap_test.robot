*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/swap_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
btc_usd
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Swap
    Tap Element By Label    Max Slippage
    Tap Element By Label    Okay
    Select From Currency    Bitcoin (BTC)
    Select To Currency    US Dollar (USD)
    Input From Amount    0.004
    Get To Amount Textbox    TO_AMOUNT
    Tap Swap Button
    Verify Label Displays    Swap 0.004 BTC for ${TO_AMOUNT} USD
    Tap Element By Label    Confirm
    Tap FOK First Row
    Verify Element Text By Field    Context    equal    Exchange
    Verify Element Text By Field    Type    equal    Fok
    Verify Element Text By Field    Amount    equal    -0.0040

usd_btc
    Tap On Back Button
    Tap Swap Reverse Button
    Input From Amount    1
    Get To Amount Textbox    TO_AMOUNT
    Tap Swap Button
    Verify Label Displays    Swap 1 USD for ${TO_AMOUNT} BTC
    Tap Element By Label    Confirm
    Tap FOK First Row
    Verify Element Text By Field    Context    equal    Exchange
    Verify Element Text By Field    Type    equal    Fok