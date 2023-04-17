*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    dismiss_verification=${True}
Suite Teardown    Close Test Application
*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
trading
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Tap On Back Button
    Clear Ticker Search
    
derivatives
    Tap Element By Label    Derivatives
    Search Ticker On Derivatives    BTC-PERP
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Tap On Back Button
    Clear Ticker Search On Derivatives

funding
    Tap On Navigation Tab By Name    Funding    
    Search Ticker On Funding    USD
    Access Trading Pair On Funding    USD
    Tap On Back Button
    Clear Ticker Search On Funding
    
pay_btc
    Tap On Navigation Tab By Name    Pay
    Tap Element By Label    Receive
    Tap Element By Label    Lightning (BTC)
    Input Amount To Receive    0.1
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Element Contains Text    minimum balance    
    
wallets
    Tap On Navigation Tab By Name    Wallets