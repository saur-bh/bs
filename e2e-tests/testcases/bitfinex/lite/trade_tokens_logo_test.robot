*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application


*** Test Cases ***
token_logos
    Tap On Navigation Tab By Name    Trading
    Search Ticker    GXT
    Verify Label Displays    Gem Exchange And Trading
    Clear Ticker Search
    Search Ticker    Fener
    Verify Label Displays    Fenerbahce Token
    Clear Ticker Search
    Search Ticker    CONV
    Verify Label Displays    Convergence
    Clear Ticker Search
    Search Ticker    APENFT
    Verify Label Displays    APENFT
    Clear Ticker Search