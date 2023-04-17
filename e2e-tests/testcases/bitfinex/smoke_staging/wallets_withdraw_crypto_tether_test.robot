*** Settings ***
Resource            ../../../../mobile/resources/init.robot
Resource            ../../../../mobile/keywords/bitfinex/withdraw_funds_keywords.robot
Resource            ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup         Run Keywords    Open Apps    Bitfinex
...                     AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown      Close Test Application


*** Test Cases ***
crypto_btc
    Tap On Navigation Tab By Name    Wallets
    Tap Element By Label    Withdraw
    Tap Element By Label    Bitcoin
    Withdraw Crypto    1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2    MAX    Margin
