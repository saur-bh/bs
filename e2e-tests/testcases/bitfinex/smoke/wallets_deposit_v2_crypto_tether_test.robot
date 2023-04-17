*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_funds_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
crypto_search
    Tap On Navigation Tab By Name    Wallets
    Tap Element By Label    Deposit
    Input Text To Textbox    bitcoin
    Verify Label Displays    Bitcoin
    Verify Label Displays    Bitcoin (Lightning Network)
    Verify Label Not Display    Ethereum
    Clear Search Text Box
    Verify Label Displays    Ethereum

crypto_btc
    Tap Element By Label    Bitcoin
    Tap Element By Label    Exchange Wallet
    Tap Element By Label    Funding
    Tap Element By Label    Confirm
    Verify Label Displays    Funding Wallet
    Tap On Back Button

crypto_memo_eos
    Input Text To Textbox    EOS
    Tap Element By Label    EOS
    Tap Element By Label    I understand. Continue.
    Verify Label Displays    Deposit EOS
    Tap On Back Button
    Clear Search Text Box

tether
    Tap Element By Label    USDt
    Tap Element By Label    Tether(USD) on Ethereum
    Tap Element By Label    Deposit Network
    Tap Element By Label    Tether(USD) on Tron
    Verify Label Displays    Tron
    Tap On Back Button

crypto_lnbtc
    Tap Element By Label    LN-BTC
    Input LN-BTC Amount On LN-BTC Deposit    1
    Input USD Amount On LN-BTC Deposit    1000
    Tap Element By Label    Generate Invoice
    Verify Label Displays    Bitcoin (Lightning Network) Address    swipe=DOWN
    Tap On Back Button

crypto_no_margin_funding_currency
    Tap Element By Label    AAVE
    Tap Element By Label    Exchange Wallet
    Tap Element By Label    Margin
    Tap Element By Label    Funding
    Tap Element By Label    Confirm

    # Tap outside to close slide-in menu
    Tap Element By Label    Deposit AAVE
    Verify Label Displays    Exchange Wallet