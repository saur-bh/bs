*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Variables ***
${pulse_title}    Bitcoin Heads for Worst Week in 8 Months as Traders Lament 'Pikachu Pattern'

*** Test Cases ***   
    
your_profile
    Access Bitfinex Pulse
    Tap Element By Accessibility Id  ${icon_profile_pulse} 
    Tap Element By Label    Your Profile
    Tap Element By Label    Edit profile
    Verify List Labels Display    EN    RU    ZH    ES    TR    PT
    Verify Label Displays    Pulse Feed Languages
    Verify Label Displays    Enable account for public leaderboard
    Verify Label Not Display    Allow Private Messages
    Verify Label Not Display    Allow Invites to Group Chats
    
update_your_profile
    Update Your Profile    nickname=automationtest    description=This is toggle off/on test    settings_public_leaderboard=ON    settings_allow_tip=OFF
    Tap Element By Label    Edit profile
    Update Your Profile    nickname=automationTestChanged    description=Changed nickName       settings_public_leaderboard=OFF    settings_allow_tip=ON