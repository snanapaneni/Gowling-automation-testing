*** Settings ***

Documentation  Defines all required resources and keywords
Library     OperatingSystem
Library     Selenium2Library
Resource    ../Xpaths/InsightsPageXpath.robot


*** Keywords ***

Navigate to Insights listing page from Home Page

    wait until element is visible   ${Logo_Xpath}    40
    wait until element is visible   ${MainNav_Insights_Xpath}
    click element   ${MainNav_Insights_Xpath}
    wait until element is visible   ${Viewall_Insights_Xpath}   40
    click element   ${Viewall_Insights_Xpath}
    wait until element is visible  ${InsightsPage_Banner_Text_Xpath}     40
    # page should contain element     ${sort_by_Xpath}
    page should contain element     ${Keyword_search_Xpath}
    page should contain element     ${Filter_by_Xpath}
    click element   ${Article_checkbox_XPath}
    wait until element is visible   ${Resource_card_Xpath}      40
    page should contain element     ${Resource_card_Xpath}
    ${Resource_type_Xpath}=     get text    ${Resource_type_Xpath}
    log to console      ${Resource_type_Xpath}
    Should Be Equal As Strings      ${Resource_type_Xpath}  Articles


Navigate to Article details page from listing page

    wait until element is visible   ${Resource_card_Xpath}  20
    wait until element is visible   ${Resource_card_content_Xpath}    30
    page should contain element     ${Resource_card_content_Xpath}
    click element   ${Resource_card_content_Xpath}
 #  wait until element is visible   ${Resource_type_tag_Xpath}  40
    wait until element is visible   ${Resource_author_section_Xpath}   40
    page should contain element     ${Resource_author_section_Xpath}
    page should contain element     ${Resource_author_text_Xpath}



