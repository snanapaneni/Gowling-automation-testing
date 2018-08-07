*** Settings ***

Documentation  Defines all required resources and keywords
Library     OperatingSystem
Library     Selenium2Library
Resource    ../Xpaths/HomePageXpath.robot

*** Keywords ***

verify default region on page load

    wait until element is visible   ${Logo_Xpath}    40
    page should contain element     ${top_left_dropdown_label_Xpath}
    page should contain element     ${top_left_dropdown_toggle_global_Xpath}
    ${top_left_dropdown_label_Xpath}=   get text    ${top_left_dropdown_label_Xpath}
    log to console  ${top_left_dropdown_label_Xpath}
    ${top_left_dropdown_toggle_global_Xpath}=     get text    ${top_left_dropdown_toggle_global_Xpath}
    log to console      ${top_left_dropdown_toggle_global_Xpath}
    Should Be Equal As Strings  ${top_left_dropdown_toggle_global_Xpath}    Global


verify default language on page load

    wait until element is visible   ${Logo_Xpath}    40
    page should contain element     ${Button_selected_language}
    page should contain element     ${language_toggle_text}
    ${language_toggle_text}=    get text    ${language_toggle_text}
    log to console  ${language_toggle_text}
    Should Be Equal As Strings  ${language_toggle_text}     English
