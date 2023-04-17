*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/swap_keywords.robot

Suite Teardown    Close Test Application

*** Test Cases ***
full
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Currency In Lite Mode    USDt    TOTAL
    Tap Element By Label    Swap USDt
    Verify From Dropdown Value    USDt
    Verify To Dropdown Value    BTC
    
intermediate
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_INTERMIDIATE_API_KEY}    ${TEST_DATA_INTERMIDIATE_API_SECRET}    Staging    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Currency In Lite Mode    USDt    TOTAL
    Tap Element By Label    Swap USDt
    Verify From Dropdown Value    USDt
    Verify To Dropdown Value    BTC
    
basic_plus
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_PLUS_API_KEY}    ${TEST_DATA_BASIC_PLUS_API_SECRET}    Staging    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Currency In Lite Mode    USDt    TOTAL
    Tap Element By Label    Swap USDt
    Verify From Dropdown Value    USDt
    Verify To Dropdown Value    BTC
    
basic
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Currency In Lite Mode    USDt    TOTAL
    Tap Element By Label    Swap USDt
    Verify From Dropdown Value    USDt
    Verify To Dropdown Value    BTC