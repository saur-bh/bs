*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
unrealized_pnl_not_shown
    Tap On Navigation Tab By Name    Wallets
    Verify Label Not Display    Unrealized P/L + Funding costs