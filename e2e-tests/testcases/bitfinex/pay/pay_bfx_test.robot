*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_VUONG0204_SUB_API_KEY}    ${TEST_DATA_VUONG0204_SUB_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
dashboard
    Tap On Navigation Tab By Name    Pay
    Tap Element By Label    Bitfinex Pay
    Verify Label Displays    Dashboard