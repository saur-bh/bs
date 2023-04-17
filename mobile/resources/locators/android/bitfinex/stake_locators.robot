*** Variables ***
${drd_i_want_to_stake}    xpath=//android.widget.TextView[@text="Amount"]/following-sibling::android.view.ViewGroup[1]
${txt_amount_stake}    xpath=//android.widget.TextView[@text="Amount"]/following-sibling::android.view.ViewGroup//android.widget.EditText
${btn_stake_support_faq}    accessibility_id=stake_support_button
${btn_stake_support_faq_close_icon}    accessibility_id=stake_support_faq_close_icon

# DYNAMIC
${lbl_estimation_rewards_in_usd_by_label}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[1]

${btn_stake_by_currency}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.view.ViewGroup[@content-desc="stake_button"][1]