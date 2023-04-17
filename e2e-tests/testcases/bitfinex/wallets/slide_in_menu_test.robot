*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
btc
    Tap On Navigation Tab By Name    Wallets
    Tap Balances Normal View Button
    Tap Balance Of Currency    BTC    exchange    total
    Verify List Labels Display    Conversion    Transfer BTC    Ledger Entries    Deposit BTC
    # close slide-in menu
    Tap On Coordinates    10    200
    Tap Balance Of Currency    BTC    margin    total
    Verify List Labels Display    Borrow    Conversion    Ledger Entries    Deposit BTC
    # close slide-in menu
    Tap On Coordinates    10    200
    Tap Balance Of Currency    BTC    funding    total
    Verify List Labels Display    Conversion    Transfer BTC    Ledger Entries    Deposit BTC