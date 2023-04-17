*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/otc_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_NOT_SETUP_OTC_NICKNAME_KEY}    ${TEST_DATA_BASIC_NOT_SETUP_OTC_NICKNAME_SECRET}    Production    dismiss_verification=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
empty_nickname
    Tap On Navigation Tab By Name    Account
    Tap Element By Label    OTC Market
    Tap Element By Label     When you are ready to begin, set OTC nickname in Account Info section.
    Tap Element By Label    Save
    Verify Label Displays    Nickname must be at least 4 characters
    Close Toast Error
    
less_than_4_chars
    Set OTC Nickname    vuo
    Verify Label Displays    Nickname must be at least 4 characters
    Close Toast Error

longer_than_32_chars
    Set OTC Nickname    vuonglongerthan32charstestingdata
    Verify Label Displays    Nickname cannot be longer than 32 characters
    Close Toast Error

existing_nickname
    Set OTC Nickname    vuongvvv
    Verify Label Displays    The OTC nickname 'vuongvvv' is already taken. Please try again.
    Close Toast Error