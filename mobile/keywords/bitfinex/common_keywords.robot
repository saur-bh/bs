*** Settings ***
Resource    ../../resources/locators/android/bitfinex/common_locators.robot
Resource    ../../../utility/common/locator_common.robot
Resource    login_keywords.robot
Resource    account_keywords.robot
Resource    two_factor_authentication_keywords.robot
Resource    ../../../utility/common/list_common.robot
Resource    ../common/mobile_common.robot


*** Variables ***
@{themes_list}      Default    White    Black    Colour blind


*** Keywords ***
Tap On Navigation Tab By Name
    [Arguments]    ${tab_name}
    IF    '${tab_name}'=='Trading'
        Click Visible Element    ${tab_trading_navigation_bar}
    ELSE IF    '${tab_name}'=='Derivatives'
        Click Visible Element    ${tab_derivatives_navigation_bar}
    ELSE IF    '${tab_name}'=='Funding'
        Click Visible Element    ${tab_funding_navigation_bar}
    ELSE IF    '${tab_name}'=='Wallets'
        Click Visible Element    ${tab_wallets_navigation_bar}
    ELSE IF    '${tab_name}'=='Account'
        Click Visible Element    ${tab_account_navigation_bar}
    ELSE IF    '${tab_name}'=='Earn'
        Click Visible Element    ${tab_stake_navigation_bar}
    ELSE IF    '${tab_name}'=='Pay'
        Click Visible Element    ${tab_pay_navigation_bar}
    END
    Sleep    1s

Tap On Login Button
    Wait Element Is Visible    ${btn_login}
    Click Visible Element    ${btn_login}

Tap On Back Button
    [Arguments]    ${repeat}=${1}
    FOR    ${index}    IN RANGE    0    ${repeat}
        Run Keyword And Continue On Failure    Click Visible Element    ${btn_back_on_screen}    delay=1s
    END
    Sleep    1s

Tap On Dropdown Item
    [Arguments]    ${item}
    ${rdo_payment_type}    Generate Element From Dynamic Locator    ${rdo_item}    ${item}
    Click Visible Element    ${rdo_payment_type}

Tap Close Icon
    Click Visible Element    ${btn_close}

Close Toast Error
    Click Visible Element    ${btn_close_toast_message}

Scroll To Element
    [Arguments]    ${element}    ${scroll}=${None}
    IF    '${scroll}'=='up'
        Swipe Up To Element    ${element}
    ELSE IF    '${scroll}'=='down'
        Swipe Down To Element    ${element}
    END

Access Bitfinex Pulse
    Click Visible Element    ${btn_pulse}

Tap Sign Up Button
    Click Visible Element    ${btn_signup}

Login And Set Up Pin
    [Arguments]
    ...    ${api_key}
    ...    ${api_secret}
    ...    ${server}
    ...    ${enable_detach}=${True}
    ...    ${lite_mode}=${False}
    ...    ${dismiss_verification}=${False}
    ${is_logout_visible}    Is Element Visible    ${btn_logout_pincode}    20s
    IF    ${is_logout_visible}==${True}    Logout Bitfinex On Pincode Screen
    IF    '${ENV}'=='staging'
        Tap On Navigation Tab By Name    Account
        Choose Server    ${server}
    END
    ${first_time}    Is Element Visible    ${btn_close_Tailored}    timeout=3s
    IF    ${first_time}==${True}
        Click Visible Element    ${btn_close_tailored}
    END
    Tap On Login Button
    Tap Element By Label    API Key
    ${choose_image}    Is Element Visible    ${btn_whilte_using_the_app}    timeout=3s
    IF    ${choose_image}==${True}    Tap While Using The App Button
    Tap On Add Key
    Login Bitfinex    ${api_key}    ${api_secret}
    Enter Pin Code
    Enter Pin Code
    Tap Close Icon
    IF    ${dismiss_verification}==${True}    Tap Element By Label    Dismiss
    Verify Pulse Button Displays
    IF    ${lite_mode}==${True}
        Switch To Lite Mode
    ELSE
        Switch To Pro Mode
    END
    Tap On Navigation Tab By Name    Trading

Login And Set Up Pin Turkish App
    [Arguments]    ${api_key}    ${api_secret}    ${server}    ${enable_detach}=${True}    ${lite_mode}=${False}
    ${is_logout_visible}    Is Element Visible    ${btn_logout_pincode}    20s
    IF    ${is_logout_visible}==${True}    Logout Bitfinex On Pincode Screen
    Tap On Login Button
    Tap Element By Label    API Key
    Tap On Add Key
    Login Bitfinex    ${api_key}    ${api_secret}
    Enter Pin Code
    Enter Pin Code
    Verify Pulse Button Displays
    IF    ${lite_mode}==${True}
        Switch To Lite Mode
    ELSE
        Switch To Pro Mode
    END

    # SELECT THEME
    Tap On Navigation Tab By Name    Account
    ${theme}    Random Item In List    ${themes_list}
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Themes
    Tap On Account Menu Item    ${theme}
    Tap On Back Button    2

    Tap On Navigation Tab By Name    Trading

Login With Account Turkish App
    [Arguments]    ${email_or_username}    ${password}    ${2fa_secret}    ${lite_mode}=${False}
    ${is_logout_visible}    Is Element Visible    ${btn_logout_pincode}    20s
    IF    ${is_logout_visible}==${True}    Logout Bitfinex On Pincode Screen
    Tap On Login Button
    Login Using Email    ${email_or_username}    ${password}
    Input 2FA Code    ${2fa_secret}
    Enter Pin Code
    Enter Pin Code
    # Run Keyword If    ${lite_mode}==${True}    Switch To Lite Mode
    # ...    ELSE    Switch To Pro Mode
    # SELECT THEME
    Tap On Navigation Tab By Name    Account
    ${theme}    Random Item In List    ${themes_list}
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Themes
    Tap On Account Menu Item    ${theme}
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Trading

Login With Email
    [Arguments]
    ...    ${email}
    ...    ${password}
    ...    ${2fa_secret}
    ...    ${server}
    ...    ${enable_detach}=${False}
    ...    ${lite_mode}=${False}
    Logout Bitfinex On Pincode Screen
    IF    '${ENV}'=='staging'
        Tap On Navigation Tab By Name    Account
        Choose Server    ${server}
    END
    Tap On Login Button
    Login Using Email    ${email}    ${password}
    Input 2FA Code    ${2fa_secret}
    Enter Pin Code
    Enter Pin Code
    Verify Pulse Button Displays

Enter Pin Code To Login
    Tap Element By Label    8
    Tap Element By Label    8
    Tap Element By Label    8
    Tap Element By Label    8

Logout And Select Server
    [Arguments]    ${server}    ${lite_mode}=${False}
    Logout Bitfinex On Pincode Screen
    IF    '${ENV}'=='staging'
        Tap On Navigation Tab By Name    Account
        Choose Server    ${server}
    END
    IF    ${lite_mode}==${True}
        Switch To Lite Mode
    ELSE
        Switch To Pro Mode
    END
    Tap On Navigation Tab By Name    Trading

Logout Bitfinex
    Tap On Navigation Tab By Name   Account
    Logout Bitfinex App
    Verify Login Panel

Logout Bitfinex On Pincode Screen
    ${is_logout_visible}    Is Element Visible    ${btn_logout_pincode}    10s
    IF    ${is_logout_visible}==${True}
        Click Visible Element    ${btn_logout_pincode}
        Click Visible Element    ${btn_logout_on_modal_pincode}
        Verify Login Panel
    END

Enable Detach Inactive Screen
    [Arguments]    ${lite_mode}=${False}
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Build Version    swipe_direction=down
    Toggle Detach Inactive Screens

Tap Element By Label
    [Arguments]
    ...    ${element_label}
    ...    ${delay}=${None}
    ...    ${repeat}=1
    ...    ${swipe}=${None}
    ...    ${wait_disappear}=${False}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_by_text}    ${element_label}
    Click Visible Element    ${label_element}    delay=${delay}    repeat=${repeat}    swipe=${swipe}
    IF    ${wait_disappear}==${True}
        Wait Element Disappear    ${label_element}
    END

Tap Element By Accessibility Id
    [Arguments]
    ...    ${accessibility_id}
    ...    ${delay}=${None}
    ...    ${repeat}=1
    ...    ${swipe}=${None}
    ...    ${wait_disappear}=${False}
    ${element_by_accessibility_id}    Generate Element From Dynamic Locator
    ...    ${element_by_accessibility_id}
    ...    ${accessibility_id}
    Click Visible Element    ${element_by_accessibility_id}    delay=${delay}    repeat=${repeat}    swipe=${swipe}
    IF    ${wait_disappear}==${True}
        Wait Element Disappear    ${element_by_accessibility_id}
    END

Scroll To Element By Label
    [Arguments]    ${label}    ${ratio}    ${swipe}=${None}    ${start_x}=${None}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_by_text}    ${label}
    Swipe To Element    ${label_element}    ${ratio}    ${swipe}    start_x=${start_x}

Tap Button By Label
    [Arguments]    ${element_label}    ${delay}=${None}    ${wait_disappear}=${True}    ${swipe}=${None}
    ${btn_element}    Generate Element From Dynamic Locator    ${btn_label_by_text}    ${element_label}
    IF    '${swipe}'=='UP'
        Swipe Up To Element    ${btn_element}
    ELSE IF    '${swipe}'=='DOWN'
        Swipe Down To Element    ${btn_element}
    END
    Click Visible Element    ${btn_element}    delay=${delay}
    IF    ${wait_disappear}==${True}    Wait Element Disappear    ${btn_element}

Tap Element Contains Label
    [Arguments]    ${element_label}    ${delay}=${None}    ${repeat}=1    ${swipe}=${None}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_contains_by_text}    ${element_label}
    Click Visible Element    ${label_element}    delay=${delay}    repeat=${repeat}    swipe=${swipe}

Get Text Element Contains Label
    [Arguments]    ${element_label}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_contains_by_text}    ${element_label}
    ${return_text}    Get Element Text    ${label_element}
    RETURN    ${return_text}

Get Element Text By Field
    [Arguments]    ${field_name}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_value_by_field}    ${field_name}
    ${return_text}    Get Element Text    ${label_element}
    RETURN    ${return_text}

# TEXT BOX

Input Text To Textbox
    [Arguments]    ${text}
    Input Text Into Element    ${txt_textbox_on_bitfinex}    ${text}    clear_text=${True}

Tap Value By Field Name
    [Arguments]    ${field_name}    ${delay}=${None}
    ${value_element}    Generate Element From Dynamic Locator    ${lbl_value_by_field}    ${field_name}
    Click Visible Element    ${value_element}    delay=${delay}

# BANNER

Tap Close Banner Button
    Click Visible Element    ${btn_x_close_banner}

Verify Loading Progress Icon Displays
    Wait Element Is Visible    ${ico_loading_progress}
    Wait Element Disappear    ${ico_loading_progress}

Verify Pulse Button Displays
    Wait Element Is Visible    ${btn_pulse}    30s

Verify Login Panel
    Wait Element Is Visible    ${btn_login}
    Wait Element Is Visible    ${btn_signup}
    Sleep    2s

Verify Permission Message
    [Arguments]    ${message}    ${scroll}=${None}
    ${lbl_permission_message}    Generate Element From Dynamic Locator    ${lbl_permission_by_text}    ${message}
    Scroll To Element    ${lbl_permission_message}    ${scroll}
    Run Keyword And Continue On Failure    Wait Element Is Visible    ${lbl_permission_message}

Verify Hidden Tab
    [Arguments]    ${tab_name}
    IF    '${tab_name}'=='Trading'
        Wait Element Disappear    ${tab_trading_navigation_bar}
    ELSE IF    '${tab_name}'=='Derivatives'
        Wait Element Disappear    ${tab_derivatives_navigation_bar}
    ELSE IF    '${tab_name}'=='Funding'
        Wait Element Disappear    ${tab_funding_navigation_bar}
    ELSE IF    '${tab_name}'=='Wallets'
        Wait Element Disappear    ${tab_wallets_navigation_bar}
    ELSE IF    '${tab_name}'=='Account'
        Wait Element Disappear    ${tab_account_navigation_bar}
    ELSE IF    '${tab_name}'=='Stake'
        Wait Element Disappear    ${tab_stake_navigation_bar}
    ELSE IF    '${tab_name}'=='Pay'
        Wait Element Disappear    ${tab_pay_navigation_bar}
    END

Verify Label Displays
    [Arguments]
    ...    ${expected_label}
    ...    ${swipe}=${None}
    ...    ${timeout}=${None}
    ...    ${wait_disappear}=${False}
    ...    ${delay}=${None}
    IF    '${delay}'!='${None}'    Sleep    ${delay}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_by_text}    ${expected_label}
    IF    '${swipe}'=='UP'
        Swipe Up To Element    ${label_element}
    ELSE IF    '${swipe}'=='DOWN'
        Swipe Down To Element    ${label_element}
    END
    Wait Element Is Visible    ${label_element}    timeout=${timeout}
    IF    ${wait_disappear}==${True}
        Wait Element Disappear    ${label_element}
    END

Verify List Labels Display
    [Arguments]    @{list_labels}
    FOR    ${element}    IN    @{list_labels}
        Verify Label Displays    ${element}
    END

Verify Label Not Display
    [Arguments]    ${expected_label}
    ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_by_text}    ${expected_label}
    Wait Element Disappear    ${label_element}

Verify Element Contains Text
    [Arguments]    ${expected_text}    ${timeout}=${None}    ${wait_disappear}=${False}
    ${element}    Generate Element From Dynamic Locator    ${lbl_label_contains_by_text}    ${expected_text}
    Wait Element Is Visible    ${element}    timeout=${timeout}
    IF    ${wait_disappear}==${True}    Wait Element Disappear    ${element}

Verify External Browser URL
    [Arguments]    ${expected_url}
    Verify Element Text Contains    ${txt_external_browser_url}    ${expected_url}

Verify Label Contain Text Not Display
    [Arguments]    @{list_labels}
    FOR    ${element}    IN    @{list_labels}
        ${label_element}    Generate Element From Dynamic Locator    ${lbl_label_contains_by_text}    ${element}
        Wait Element Disappear    ${label_element}
    END

Verify Textbox Text
    [Arguments]    ${expected_text}
    Verify Element Text Should Be    ${txt_textbox_on_bitfinex}    ${expected_text}    delay=1s

Verify Element Text By Field
    [Arguments]    ${field_name}    ${verify_type}    ${expected_value}=${None}
    ${field_text}    Get Element Text By Field    ${field_name}
    IF    "${verify_type}"=="equal"
        Should Be Equal    ${field_text}    ${expected_value}
    END

Access And Verify By Label
    [Arguments]    ${tap_label}    ${verify_label}
    Tap Element By Label    ${tap_label}
    Verify Label Displays    ${verify_label}
    Tap Close Icon
