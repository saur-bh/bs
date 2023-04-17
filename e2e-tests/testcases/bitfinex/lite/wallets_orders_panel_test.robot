*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
orders_panel
    Tap On Navigation Tab By Name    Wallets
    Search For Currency On Balance    EOS
    Swipe To Wallets Panel    ORDERS    0.2    DOWN
    Tap Element By Label    Open
    Verify Label Displays    No orders found    swipe=DOWN
    Tap Element By Label    History
    Verify Label Displays    FULL ORDER HISTORY    swipe=DOWN