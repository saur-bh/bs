*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/create_account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/lite_order_form_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    production
Suite Teardown    Close Test Application

*** Variables ***
${pulse_post}    The bitcoin price is down 19% in the past seven days – the cryptocurrency's worst weekly performance since May 2021, when fears of China's renewed crackdown on cryptocurrency trading and mining sent the market reeling, and tweets by Tesla CEO Elon Musk focused public attention on the Bitcoin blockchain network's potential environmental harms.
${post_comment}  This is my test comment
${expected_text}    Automatic 

*** Test Cases ***
 post_comment_pulse
    Skip
    Access Bitfinex Pulse
    Tap Pulse Option  Bitfinex    
    Verify Label Displays   Pinned Pulse
    Scroll To Element By Label    Reply     0.08    DOWN
    Wait Element Is Visible    ${btn_bitfinex_reply}
    Tap Element By Label  Reply
    Create New Pulse    ${post_comment}
    Verify Label Displays    Comment posted successfully.

delete_comment_pulse
    skip
    Swipe Down To Element     ${txt_post_comment} 
    Tap Element By Label    less than a minute ago
    Verify Delete Pulse

pulse_create_new_pulse
    Skip
    Tap Create New Pulse
    Create New Pulse   ${pulse_post}   
    Verify Label Displays    Pulse created successfully.
    Tap Pulse Back Button
    Tap Element By Accessibility Id  ${icon_profile_pulse} 
    Tap Element By Label    Pulses
    Verify Delete Pulse



   
    




 
    


    
    
    
