*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitrefill_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/affiliate_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
login_access_banner
    Tap Element By Label    Bitrefill now on mobile!
    Verify Bitrefill Screen Displays
    Tap Element By Label    Borrow
    Verify Borrow Screen Displays
    
login_close_banner
    Tap Close Banner Button
    Verify Label Not Display    Bitrefill now on mobile!
    Verify Label Not Display    Borrow
    
guest_access_banner
    Logout Bitfinex
    Tap On Navigation Tab By Name    Trading
    Tap Element By Label    Start earning with Affiliate
    Verify External Browser URL    bitfinex.com/affiliates/
    
guest_close_banner
    Tap Device Back Button
    Tap Close Banner Button
    Verify Label Not Display    Start earning with Affiliate