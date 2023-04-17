*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
orders_panel
    Tap On Navigation Tab By Name    Wallets
    Search For Currency On Balance    BTC
    Swipe To Wallets Panel    ORDERS    0.2    DOWN
    Tap Element By Label    Open
    Verify Label Displays    No orders found    swipe=DOWN
    Tap Element By Label    History
    Verify Label Displays    No order history found    swipe=DOWN