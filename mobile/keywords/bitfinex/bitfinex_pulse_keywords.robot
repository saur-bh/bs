*** Settings ***
Resource    ../../resources/locators/android/bitfinex/bitfinex_pulse_locators.robot

*** Keywords ***
Tap Create New Pulse
    Click Visible Element    ${btn_create_new_pulse}

Tag Person When Create Pulse
    [Arguments]    ${tag_person}
    Input Text Into Element    ${txt_create_pulse_content}    @
    Sleep    2s
    Input Text Into Element    ${txt_create_pulse_content}    vu
    Sleep    5s    
    Tap Element By Label    @${tag_person}
    Sleep    5s    
        
Create New Pulse
    [Arguments]    ${content} 
    Wait Element Is Visible     ${text_post_creation}
    Click Element    ${text_post_creation}
    Input Text Into Element    ${text_post_creation}    ${content} 
    Sleep	1s
    Tap Element By Label    Post
    Sleep	2s

Tap Pulse Option 
    [Arguments]   ${option}
    Tap Element By Label    ${option}    

Tap Pulse Option Button
    [Arguments]    ${option}
    Click Visible Element    ${btn_pulse_option}
    Tap Element By Label    ${option}
    
# YOUR PROFILE    
Tap Edit Profile Button Of Your Pulse
    Click Visible Element    ${btn_edit_profile_on_your_pulse}
    
Toggle Your Profile Settings
    [Arguments]    ${public_leaderboard}    ${show_twitter_name}
    Toggle Switch    ${tgl_enable_account_for_public_leaderboard}    ${public_leaderboard}
    Toggle Switch    ${tgl_show_twitter_nickname}    ${show_twitter_name}

Update Your Profile
    [Arguments]    ${nickname}=${None}    ${description}=${None}    ${settings_public_leaderboard}=${None}    ${settings_allow_tip}=${None}
    Run Keyword If    "${nickname}"!="${None}"   Input Text Into Element    ${txt_nickname}    ${nickname}    clear_text=${True}
    Run Keyword If    "${description}"!="${None}"   Input Text Into Element    ${txt_say_something_about_yourself}    ${description}    clear_text=${True}
    Run Keyword If    "${settings_public_leaderboard}"!="${None}"   Toggle Switch    ${tgl_enable_account_for_public_leaderboard}    ${settings_public_leaderboard}
    Run Keyword If    "${settings_allow_tip}"!="${None}"   Toggle Switch    ${tgl_settings_allow_tip}    ${settings_allow_tip} 
    Tap Element By Label    Save    wait_disappear=${True}
    
Tap Bitfinex Pulse Back Button
    Click Visible Element    ${btn_bitfinex_pulse_back}
    
Verify Pulse Content
    [Arguments]    ${expected_content}
    Verify Element Text    ${txt_create_pulse_content}    equal    ${expected_content}

Verify Delete Pulse
    Wait Element Is Visible    ${btn_pulse_option}
    Click Element   ${btn_pulse_option}
    Tap Element By Label    Delete
    Tap Element By Label   Confirm
    Sleep     1s
    Verify Label Displays    Pulse deleted successfully.
Tap Pulse Back Button 
    Tap Element By Accessibility Id    ${btn_back_pulse}
    

Comment icon
    ${is_comment_btn_visible}    Is Element Visible   ${btn_after_post_comment}     5s
    [Return]    ${is_comment_btn_visible}

Share Icon 
    ${is_share_btn_visible}    Is Element Visible   ${btn_after_post_share}    5s
    [Return]    ${is_share_btn_visible}
    

