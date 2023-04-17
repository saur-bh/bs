*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/lite_order_form_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
market_buy_usdt
    Tap On Navigation Tab By Name    Trading
    Search Ticker    USDT
    Access Trading Pair    USTUSD
    Select Lite Order Type    BUY
    Verify Label Displays    Market Buy
    Verify Label Displays    ≈ 0 USD
    Verify Element Contains Text    USDt
    Verify Element Contains Text    USD

market_buy_usdt_percentages
    Enter Lite Order Amount    25 PERCENT    delay=2s
    Verify Amount Text    126
    Enter Lite Order Amount    50 PERCENT
    Verify Amount Text    253
    Enter Lite Order Amount    100 PERCENT
    Verify Amount Text    507
        
market_buy_usdt_swap_button
    Tap Close Icon
    Select Lite Order Type    BUY
    Tap Base Quote Swap Button
    Verify Label Displays    ≈ 0 USDt
    Verify Element Contains Text    USDt
    Verify Element Contains Text    USD
    Enter Lite Order Amount    25 PERCENT
    Verify Amount Text    126
    Enter Lite Order Amount    50 PERCENT
    Verify Amount Text    253
    Enter Lite Order Amount    100 PERCENT
    Verify Amount Text    507

limit_buy_usdt
    Switch Lite Order Type    Limit Buy
    Enter Lite Order Price    BEST BID
    Verify Amount Text    1.0
    Enter Lite Order Price    BEST ASK
    Verify Amount Text    1.0
    
limit_buy_usdt_percentages
    Tap Review Buy Sell Button
    Enter Lite Order Amount    25 PERCENT
    Verify Amount Text    126
    Enter Lite Order Amount    50 PERCENT
    Verify Amount Text    25
    Enter Lite Order Amount    100 PERCENT
    Verify Amount Text    50
    
limit_buy_usdt_swap_button
    Tap Close Icon
    Select Lite Order Type    BUY
    Tap Base Quote Swap Button
    Verify Label Displays    ≈ 0 USDt
    Verify Element Contains Text    USDt
    Verify Element Contains Text    USD
    Enter Lite Order Amount    25 PERCENT
    Verify Amount Text    126
    Enter Lite Order Amount    50 PERCENT
    Verify Amount Text    25
    Enter Lite Order Amount    100 PERCENT
    Verify Amount Text    50
    
market_buy_btc_order
    Tap Close Icon
    Tap On Back Button
    Search Ticker    BTC
    Access Trading Pair    BTCUSD
    Select Lite Order Type    BUY
    Enter Lite Order Amount    0.0001
    Tap Element By Label    Review Buy
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    Exchange Market Buy for 0.00010000 BTC
    Verify Element Contains Text    (≈1
    Verify Element Contains Text    USD)
    Tap Element By Label    Confirm
    Verify Element Contains Text    exchange market buy order of 0.0001 BTC has been fully executed at

market_sell_btc_order
    Select Lite Order Type    SELL
    Enter Lite Order Amount    0.0001
    Tap Element By Label    Review Sell
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    Exchange Market Sell for 0.00010000 BTC
    Verify Element Contains Text    (≈1
    Verify Element Contains Text    USD)
    Tap Element By Label    Confirm
    Verify Element Contains Text    exchange market sell order of 0.0001 BTC has been fully executed at

limit_buy_btc_order
    Select Lite Order Type    BUY
    Switch Lite Order Type    Limit Buy
    Enter Lite Order Price    BEST BID
    Tap Set Limit Price Button
    Enter Lite Order Amount    0.0001
    Tap Element By Label    Review Buy
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    Exchange Limit Buy for 0.00010000 BTC at
    Verify Element Contains Text    USD
    Tap Element By Label    Confirm
    
limit_sell_btc_order
    Select Lite Order Type    SELL
    Switch Lite Order Type    Limit Sell
    Enter Lite Order Price    BEST ASK
    Tap Set Limit Price Button
    Enter Lite Order Amount    0.0001
    Tap Element By Label    Review Sell
    Verify Element Contains Text    Please confirm the following order
    Verify Element Contains Text    Exchange Limit Sell for 0.00010000 BTC at
    Verify Element Contains Text    USD
    Tap Element By Label    Confirm
    Tap Element By Label    Cancel BTC/USD orders    swipe=DOWN
    Verify Element Contains Text    exchange limit