*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}
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