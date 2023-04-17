*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/margin_metrics_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
long_short_analytics
    Access Trading Pair    BTCUSD
    Scroll To Element By Label    ORDER BOOK    0.1    DOWN
    Select Order Form Tab    Account Summary 
    Tap Element By Label    View analytics
    Verify Loading Progress Icon Displays
    Config Margin Metrics    1 MINUTE
    Verify Label Displays    Maximum 3 days of interval for the selected granularity