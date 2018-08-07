*** Settings ***

Documentation  Defines all required resources and keywords
Library     OperatingSystem
Library     Selenium2Library
Resource    ../Xpaths/PeoplePageXpath.robot


*** Keywords ***

Navigate to People page from Home Page

    wait until element is visible   ${Logo_Xpath}    40
    wait until element is visible   ${MainNav_People_Xpath}
    click element    ${MainNav_People_Xpath}
    wait until element is visible   ${PeoplePage_Banner_Text_Xpath}
    click element   ${Filter_Canada_Xpath}
    wait until element is visible   ${Filter_sortby_Xpath}   20
    page should contain element     ${Filter_sortby_Xpath}
    page should contain element     ${Bio_Card_Xpath}
    ${Bio_Name_Xpath}=   get text    ${Bio_Name_Xpath}
    log to console      ${Bio_Name_Xpath}
    Should Be Equal As Strings  ${Bio_Name_Xpath}    Neil S. Abbott

