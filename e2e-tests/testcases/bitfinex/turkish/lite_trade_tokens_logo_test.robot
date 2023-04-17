*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}    lite_mode=${True}
Suite Teardown    Close Test Application


*** Test Cases ***
token_logos
    Tap On Navigation Tab By Name    Trading
    Search Ticker    GXT
    Verify Label Displays    Gem Exchange And Trading
    Search Ticker    Fener
    Verify Label Displays    Fenerbahce Token
    Search Ticker    CONV
    Verify Label Displays    Convergence
    Search Ticker    APENFT
    Verify Label Displays    APENFT
    Search Ticker    BOO
    Verify Label Displays    BOO
    Search Ticker    HEC
    Verify Label Displays    HEC
    Search Ticker    TREEB
    Verify Label Displays    TREEB