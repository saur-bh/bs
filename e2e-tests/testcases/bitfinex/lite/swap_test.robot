*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/swap_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
btc_eth
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Swap
    Select From Currency    Bitcoin (BTC)
    Select To Currency    Ethereum (ETH)
    Input From Amount    0.002
    Get To Amount Textbox    TO_AMOUNT
    Tap Swap Button
    Verify Label Displays    Swap 0.002 BTC for ${TO_AMOUNT} ETH
    Tap Element By Label    Confirm
    Tap FOK First Row
    Verify Element Text By Field    Context    equal    Exchange
    Verify Element Text By Field    Type    equal    Fok
    Verify Element Text By Field    Amount    equal    ${TO_AMOUNT}

eth_btc
    Tap On Back Button
    Tap Swap Reverse Button
    Input From Amount    0.002
    Get To Amount Textbox    TO_AMOUNT
    Tap Swap Button
    Verify Label Displays    Swap 0.002 ETH for ${TO_AMOUNT} BTC
    Tap Element By Label    Confirm
    Tap FOK First Row
    Verify Element Text By Field    Context    equal    Exchange
    Verify Element Text By Field    Type    equal    Fok
    Verify Element Text By Field    Amount    equal    -${TO_AMOUNT}