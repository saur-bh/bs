*** Variables ***
${btn_close_tailored}                   accessibility_id=close_icon
${btn_login}                            accessibility_id=Login-Navigation-Button
${btn_signup}                           accessibility_id=Signup-Navigation-Button
${btn_pulse}                            accessibility_id=pulse_button
${btn_join_now_on_affiliate_program}    xpath=//android.widget.TextView[@text='Join Now']
${btn_back_on_screen}                   xpath=//android.widget.Button[contains(@content-desc,", back") or @content-desc="Go back"]
${btn_close}                            xpath=//*[contains(@content-desc,"close")]/android.widget.TextView[2] | //*[contains(@content-desc,"close_icon")]
${drd_time_intervals}                   xpath=//android.view.View[@resource-id='header-toolbar-intervals']
${drd_candle_types}                     xpath=//android.view.View[@resource-id='header-toolbar-chart-styles']
${drd_indicators}                       xpath=//android.view.View[@resource-id='header-toolbar-indicators']
${btn_logout_pincode}                   xpath=//android.widget.TextView[@text='Log Out']
${btn_logout_on_modal_pincode}          xpath=(//android.widget.TextView[@text="Log Out"])[2]
${tab_trading_navigation_bar}           accessibility_id=Tab-Trading
${tab_derivatives_navigation_bar}       accessibility_id=Tab-Derivative
${tab_funding_navigation_bar}           accessibility_id=Tab-Funding
${tab_wallets_navigation_bar}           accessibility_id=Tab-Wallet
${tab_account_navigation_bar}           xpath=//android.view.View[@content-desc="Tab-Settings"]
${tab_stake_navigation_bar}             accessibility_id=Tab-Stake
${tab_pay_navigation_bar}               accessibility_id=Tab-FastPay
${txt_external_browser_url}             xpath=//android.widget.EditText[contains(@resource-id,"url_bar")]
${txt_textbox_on_bitfinex}              xpath=//android.widget.EditText
${btn_close_toast_message}              xpath=//android.view.ViewGroup[@content-desc="toast_error"]/android.view.ViewGroup
# BANNER
${btn_x_close_banner}                   accessibility_id=banner_close_icon

# DYNAMIC
${tab_navigation_by_name}               xpath=//android.widget.Button[@content-desc='Tab-_DYNAMIC_0']
${lbl_permission_by_text}               xpath=//android.widget.TextView[contains(@text,"_DYNAMIC_0")]
${lbl_label_by_text}                    xpath=//android.widget.TextView[@text="_DYNAMIC_0"] | //android.view.View[@text="_DYNAMIC_0"] | //android.widget.Button[@text="_DYNAMIC_0"]
${element_by_accessibility_id}          accessibility_id=_DYNAMIC_0
${btn_label_by_text}                    xpath=//android.widget.Button[@text="_DYNAMIC_0"]
${lbl_label_contains_by_text}           xpath=//*[contains(@text,"_DYNAMIC_0")]
${lbl_value_by_field}                   xpath=//android.widget.TextView[@text="_DYNAMIC_0"]//following::android.widget.TextView[1]
${ico_loading_progress}                 xpath=//android.widget.ProgressBar
