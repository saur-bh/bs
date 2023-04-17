*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/reports_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/leaderboard_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/affiliate_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/bitrefill_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/staking_rewards_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/appearance_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/themes_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/language_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/zoom_fonts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/changelog_updates_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/price_alerts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/notification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/support_center_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/live_chat_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/permissions_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/address_book_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_settings_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/change_pin_code_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
lending_pro
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Lending Pro
    Verify Label Displays    LENDING PERFORMANCE    timeout=30s
    
verification
    Tap On Back Button
    Tap On Account Menu Item    Verification
    Verify Verification Screen Displays

reports
    Tap Device Back Button
    Tap On Account Menu Item    Reports
    Verify Reports Screen Displays
    
borrow
    Tap On Back Button
    Tap On Account Menu Item    Borrow
    Verify Borrow Screen Displays

leaderboard    
    Tap On Back Button
    Tap On Account Menu Item    Leaderboard
    Verify Leaderboard Screen Displays
    
affiliate_program
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Verify Label Displays    Today's revenues    timeout=30s
    
stake
    Tap On Back Button
    Tap On Account Menu Item    Stake
    Verify Label Displays    Staking supported tokens in your wallet automatically earn weekly rewards.