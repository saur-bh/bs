*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application
*** Variables ***
${pulse_post}    The bitcoin price is down 19% in the past seven days – the cryptocurrency's worst weekly performance since May 2021, when fears of China's renewed crackdown on cryptocurrency trading and mining sent the market reeling, and tweets by Tesla CEO Elon Musk focused public attention on the Bitcoin blockchain network's potential environmental harms.
${post_comment}  This is my test comment
${expected_text}    Automatic 

*** Test Cases ***
pulse_create_new_pulse
    Access Bitfinex Pulse
    Tap Create New Pulse
    Create New Pulse   ${pulse_post}   
    Verify Label Displays    Pulse created successfully.
    Tap Element By Accessibility Id  ${icon_profile_pulse} 
    Tap Element By Label    Pulses
    Verify Delete Pulse
pulse_create_no_comment
    Tap Create New Pulse 
    Tap Element By Accessibility Id  ${btn_comment} 
    Verify Label Displays  Pulse comments disabled
    Create New Pulse   ${pulse_post}   
    Verify Label Displays    Pulse created successfully.
    ${is_comment_btn_visible}  Comment icon 
    Run Keyword If   ${is_comment_btn_visible}==${False}    Verify Delete Pulse

pulse_create_no_public
    Tap Create New Pulse 
    Tap Element By Accessibility Id  ${btn_visible}
    Verify Label Displays  Pulse public disabled
    Create New Pulse   ${pulse_post}   
    Verify Label Displays    Pulse created successfully.
    Wait Element Is Visible    ${btn_pulse_option}
    Click Element   ${btn_pulse_option}
    Tap Element By Label    Make public
    ${is_share_btn_visible}  Share Icon
    Run Keyword If   ${is_share_btn_visible}==${True}    Tap Element By Label    Make private
    Verify Delete Pulse

pulse_create_pinned
    Tap Create New Pulse 
    Sleep    2s
    Tap Element By Accessibility Id  ${btn_pinned}
    Verify Label Displays  Pulse pin enabled
    Create New Pulse   ${pulse_post}   
    Verify Label Displays    Pulse created successfully.
    Verify Element Contains Text  Pinned Pulse  
    Wait Element Is Visible    ${btn_pulse_option}
    Click Element   ${btn_pulse_option}
    Tap Element By Label    Unpin
    Verify Delete Pulse
   


   
    


