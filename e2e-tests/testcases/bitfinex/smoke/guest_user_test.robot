*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trading_exchange
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Create Limit Order    60000    0.001    BUY    confirm=${False}
    Tap Element By Label    Log In
    Tap Close Icon

funding
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.013784    0.00000001    120    BID    confirm=${False}
    Tap Element By Label    Log In
    Tap Close Icon
    
wallets
    Tap On Navigation Tab By Name    Wallets
    Tap Element By Label    Deposit
    Tap Element By Label    Log In
    Tap Close Icon
    
pay
    Tap On Navigation Tab By Name    Pay
    Tap Element By Label    Send
    Tap Element By Label    Log In
    Tap Close Icon
    
account
    Tap On Navigation Tab By Name    Account
    Tap Element By Label    Verification
    Tap Element By Label    Sign Up
    Tap Close Icon