*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trading
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Scroll To Element By Label    FULL BOOK    0.2    swipe=DOWN
    Verify Label Displays    FULL BOOK
    Put App In Background
    Verify Label Displays    FULL BOOK
    
derivatives
    Tap On Back Button    
    Tap On Navigation Tab By Name    Derivatives
    Search Ticker On Derivatives    BTC-PERP
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Element By Label    FULL BOOK    0.1    swipe=DOWN
    Verify Label Displays    FULL BOOK
    Put App In Background
    Verify Label Displays    FULL BOOK
    
funding
    Tap On Back Button
    Tap On Navigation Tab By Name    Funding
    Search Ticker On Funding    USD
    Access Trading Pair On Funding    USD
    Scroll To Element By Label    FULL BOOK    0.2    swipe=DOWN
    Verify Label Displays    FULL BOOK
    Put App In Background
    Verify Label Displays    FULL BOOK