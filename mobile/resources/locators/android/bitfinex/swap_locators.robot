*** Variables ***
${drd_from_currency}    xpath=//android.view.ViewGroup[@content-desc="swap_from_picker"]/android.view.ViewGroup/android.widget.TextView
${txt_from_amount}    accessibility_id=swap_from_input
${drd_to_currency}    xpath=//android.view.ViewGroup[@content-desc="swap_to_picker"]/android.view.ViewGroup/android.widget.TextView
${txt_to_amount}    accessibility_id=swap_to_input
${btn_swap_reverse}    accessibility_id=swap_reverse
${btn_swap}    accessibility_id=swap
${lbl_usd_equivalent_on_from}    xpath=//android.widget.EditText[@content-desc="swap_from_input"]/following-sibling::android.view.ViewGroup/android.widget.TextView

# ORDER HISTORY
${tbl_fok_first_row}    xpath=(//android.widget.TextView[@text="Fok"])[1]