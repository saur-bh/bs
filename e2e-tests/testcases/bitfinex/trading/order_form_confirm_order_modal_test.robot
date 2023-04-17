*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
exchange
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Create Limit Order    max_bid    0.00000001    buy    confirm=${False}
    Verify Element Contains Text    Please confirm the following order: Exchange Limit Buy for 0.00000001 BTC at
    Tap Element By Label    Cancel
    
margin
    Select Order Form Tab    Margin
    Select Order Type    Stop
    Create Stop Order    min_ask    0.00000001    buy    confirm=${False}
    Verify Element Contains Text    Please confirm the following order: Margin Stop Buy for 0.00000001 BTC at 
    Tap Element By Label    Cancel