*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/sub_account_details_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
hide_sub_accounts_and_security_accounts
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Account
    Verify Label Not Display    SUB ACOUNTS
    Verify Label Not Display    SECURITY ACCOUNTS
    
hide_deactive_for_sub_account
    Tap Element By Label    vuongvvvsub
    Verify Label Not Display    Deactive