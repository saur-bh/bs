*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/reports_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/affiliate_keywords.robot
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
Resource    ../../../../mobile/keywords/bitfinex/sub_account_details_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_settings_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/change_pin_code_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
verification
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Verification
    Verify Label Displays    Account Verification

reports    
    Tap On Back Button
    Tap On Account Menu Item    Reports
    Verify Reports Screen Displays
    
affiliate_program
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Verify Affiliate Screen Displays

shopping_bitrefill
    Tap On Back Button
    Verify Label Not Display    Shopping
    
settings_login_appearance_not_shown
    Tap On Account Menu Item    Settings
    Verify Label Not Display    Appearance
    
settings_login_settings
    Tap On Account Menu Item    Login Settings
    Verify Login Settings Displays

settings_login_settings_update_timeout
    Update Timeout    600
    
settings_login_settingschange_pin_code
    Tap On Account Menu Item    Change PIN Code
    Update Pin Code    8888    9999
        
settings_themes    
    Tap On Back Button
    Tap On Account Menu Item    Themes
    Verify Themes Screen Displays
    Verify Changing Theme
    
settings_language
    Tap On Back Button
    Tap On Account Menu Item    Language
    Verify Language Screen Displays
    Select Language    Русский
    Tap On Account Menu Item    Язык
    Select Language    English

settings_price_alert    
    Tap On Account Menu Item    Price Alerts
    Create Price Alert    1INCH/USD    1INCH/USD    USD    default    10 minutes 
    Close Price Alert    1INCH/USD
    Tap On Back Button
    Tap On Account Menu Item    Price Alerts
    Create Price Alert    BTCUSD    BTC/USD    USD    35000    10 minutes
    Close Price Alert    BTC/USD
    Tap On Back Button
    Tap On Account Menu Item    Price Alerts
    Create Price Alert    ETH USD    ETH/USD    USD    3000    10 minutes
    Close Price Alert    ETH/USD

settings_notifications    
    Tap On Back Button
    Tap On Account Menu Item    Notifications
    Verify Label Displays    IN APP NOTIFICATIONS
    Verify Label Displays    Sound alerts - Order fully executed
    
settings_zoom_fonts
    Tap On Back Button
    Tap On Account Menu Item    Zoom Fonts
    Verify Zoom Fonts Screen Displays
    
settings_changelog
    Tap On Back Button
    Tap On Account Menu Item    Changelog Updates
    Verify Changelog Updates Screen Displays

settings_hide_fastpay
    Tap On Back Button
    Verify Label Not Display    Fast Pay

contact_support_knowledge_base
    Tap On Back Button
    Tap On Account Menu Item    Contact Support
    Tap On Account Menu Item    Knowledge Base
    Verify Page Opens In Browser    Welcome to the Bitfinex Help Center
    
contact_support_create_ticket
    Tap Device Back Button
    Tap On Account Menu Item    Create Ticket
    Verify Support Center Screen Displays
    
contact_support_live_chat
    Tap On Back Button
    Tap On Account Menu Item    Live Chat
    Send Message    Hello There
    Verify Message In Live Chat Panel    What can I do for you?
    
others
    Tap Device Back Button
    Tap On Back Button
    Tap On Account Menu Item    Others
    Verify List Labels Display    Announcements    Security Policies    Community    Legal    Our Fees

others_announcement
    Tap On Account Menu Item    Announcements
    Verify Label Displays   Announcements    timeout=30s

others_security_policies
    Tap Device Back Button
    Tap On Account Menu Item    Security Policies
    Verify Page Opens In Browser    Your security is our priority

others_community
    Tap Device Back Button  
    Tap On Account Menu Item    Community
    Verify Community Screen Displays
    
others_community_telegram
    Tap On Account Menu Item    Telegram
    Verify External Browser URL    t.me/BitfinexTurkishOfficial
    Tap Device Back Button

others_community_twitter    
    Tap On Account Menu Item    Twitter
    Verify External Browser URL    mobile.twitter.com/bitfinextr
    Tap Device Back Button

others_community_reddit
    Tap On Account Menu Item    Reddit
    Verify External Browser URL    reddit.com/r/bitfinex
    Tap Device Back Button
    
others_community_medium
    Verify Label Not Display    Medium
    
others_legal
    Tap On Back Button
    Tap On Account Menu Item    Legal
    Verify Legal Screen Displays

others_legal_terms_of_service
    Tap On Account Menu Item    Terms of Service
    Verify Page Opens In Browser    IMPORTANT: By creating or funding an Account or accessing or using any of the Services (each as defined below)
    Tap Device Back Button

others_legal_api_terms_of_service
    Tap On Account Menu Item    API Terms of Service
    Verify Page Opens In Browser    Bitfinex API Terms of Service
    Tap Device Back Button

others_legal_rrt_token_term
    Tap On Account Menu Item    RRT Token Terms
    Verify Page Opens In Browser    Recovery Right Token (RRT) Terms
    Tap Device Back Button

others_legal_risk_disclosure_statement
    Tap On Account Menu Item    Risk Disclosure Statement
    Verify Page Opens In Browser    Risk Disclosure Statement
    Tap Device Back Button

others_legal_privacy_policy
    Tap On Account Menu Item    Privacy Policy
    Verify Page Opens In Browser    Bitfinex Privacy Statement
    Tap Device Back Button

others_legal_cookies_policy
    Tap On Account Menu Item    Cookies Policy
    Verify Page Opens In Browser    Cookies Policy
    Tap Device Back Button
        
others_legal_law_enforcement_request_policy
    Tap On Account Menu Item    Law Enforcement Request Policy
    Verify Page Opens In Browser    Bitfinex Law Enforcement Requests Policy
    Tap Device Back Button
        
others_legal_trademark_notices
    Tap On Account Menu Item    Trademark Notices
    Verify Page Opens In Browser    Trademarks Notices
    Tap Device Back Button
        
others_legal_anti_spam_policy
    Tap On Account Menu Item    Anti-Spam Policy
    Verify Page Opens In Browser    Anti-Spam Policy
    Tap Device Back Button
        
others_legal_affiliate_program_terms
    Tap On Account Menu Item    Affiliate Program Terms
    Verify Page Opens In Browser    Affiliate Program Terms
    Tap Device Back Button
        
others_hide_derivatives
    Tap On Back Button
    Verify Label Not Display    Derivatives

others_our_fees
    Tap On Account Menu Item    Our Fees
    Verify Page Opens In Browser    Fees Calculator
    Tap Device Back Button

account
    Tap On Back Button
    Tap On Account Menu Item    Account
    Verify List Labels Display    ACCOUNT    SUB ACCOUNTS    Address Book
    
account_permissions
    Verify Label Not Display    Permissions
    
account_address_book
    Tap On Account Menu Item    Address Book
    Tap Add Address Button