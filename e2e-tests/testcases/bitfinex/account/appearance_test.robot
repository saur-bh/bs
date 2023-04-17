*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/appearance_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
toogle_off
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Appearance
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Chart
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Positions
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Order Book
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Orders
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Chart
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Positions
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Order Book
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Orders
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    BTCUSD
    Verify Label Not Display    CHART
    Verify Label Not Display    ORDER
    Verify Label Not Display    ORDER BOOK
    Verify Label Not Display    POSITIONS
    Verify Label Not Display    ORDERS
    Verify Label Not Display    TRADES
    
toggle_on
    Tap On Back Button
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Appearance
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Chart
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Positions
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Order Book
    Tap Appearance Switch By Label    TRADING PAIR TAB    Show Orders
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Chart
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Positions
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Order Book
    Tap Appearance Switch By Label    DERIVATIVES PAIR TAB    Show Orders
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    BTCUSD
    Verify Label Displays    CHART    swipe=DOWN
    Verify Label Displays    ORDER    swipe=DOWN
    Verify Label Displays    ORDER BOOK    swipe=DOWN
    Verify Label Displays    POSITIONS    swipe=DOWN
    Verify Label Displays    ORDERS    swipe=DOWN
    Verify Label Displays    TRADES    swipe=DOWN