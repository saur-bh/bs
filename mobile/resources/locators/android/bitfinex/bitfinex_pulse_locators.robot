*** Variables ***
${icon_profile_pulse}    pulse_your_profile
${btn_pulse_search}    pulse_menu
${btn_user}     xpath=//android.widget.TextView[@resource-id="pulse.tabs.users"] 
${btn_pulses_}     xpath=//android.widget.TextView[@resource-id="pulse.tabs.pulses"] 
${text_pulse_search}    xpath=//android.widget.EditText[@content-desc="pulse_search_bar"]
${mnu_home_item_on_hamberger_menu}    accessibility_id=pulse_home
${mnu_your_pulse_item_on_hamberger_menu}    accessibility_id=pulse_your_pulse
${mnu_notifications_item_on_hamberger_menu}    accessibility_id=pulse_notifications
${mnu_messages_item_on_hamberger_menu}    accessibility_id=pulse_messages
${mnu_search_item_on_hamberger_menu}    accessibility_id=pulse_search
${btn_bitfinex_pulse_back}    pulse_back
${btn_bitfinex_reply}    xpath=//android.widget.TextView[@text="Reply"]
${search_result}    xpath=//android.widget.TextView[@text="Results"]
${text_post_creation}     xpath=//android.widget.EditText
# YOUR PROFILE
${btn_edit_profile_on_your_pulse}    accessibility_id=pulse_edit_profile
${tgl_enable_account_for_public_leaderboard}    xpath=(//android.widget.Switch)[1]
${tgl_settings_allow_tip}    xpath=(//android.widget.Switch)[2]
${txt_nickname}    xpath=(//android.widget.EditText)[2]
${txt_say_something_about_yourself}    xpath=(//android.widget.EditText)[3]




${btn_create_new_pulse}    accessibility_id=pulse_create_button
${txt_create_pulse_title}    xpath=//android.widget.EditText[@text="Title of your pulse (16 to 120 characters)"]
${txt_create_pulse_content}    xpath=//android.widget.EditText[@resource-id="content"]
${btn_pulse_option}    xpath=//android.view.ViewGroup[contains(@resource-id,"pulse_feed_item_menu")]

# DYNAMIC
${btn_pulse_option_by_title}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.view.ViewGroup/android.view.ViewGroup[5]
#BITFINEX 
${txt_post_comment}   xpath=//android.widget.TextView[contains(@text ,"less than a minute ago")]
# Create Pulse
${btn_visible}     pulse_create_toggle_visible
${btn_pinned}      pulse_create_toggle_pin
${btn_comment}     pulse_create_toggle_allow_comment
${btn_back_pulse}  pulse_back
# Post Created
${btn_after_post_comment}     xpath=//android.widget.TextView[contains(@text ,"pulse_comment_button")]
${btn_after_post_share}       xpath=//android.widget.TextView[contains(@text ,"pulse_share_button")]
