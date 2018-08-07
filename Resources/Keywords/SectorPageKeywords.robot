*** Settings ***

Documentation  Defines all required resources and keywords
Library     OperatingSystem
Library     Selenium2Library
Resource    ../Xpaths/SectorPageXpath.robot


*** Keywords ***

Navigate to Sector page from Home Page

    wait until element is visible   ${Logo_Xpath}    40
    wait until element is visible   ${MainNav_Sectors_Xpath}
    click element   ${MainNav_Sectors_Xpath}
    wait until element is visible  ${SectorsPage_Banner_Text_Xpath}     40
    page should contain element   ${Global_Text_Xpath}
    page should contain element     ${Section_Automotive_Link_Xpath}
  #  ${Auto}=  get text    ${Section_Automotive_Link_Xpath}
  #   Should Be Equal As Strings   ${Auto}  Automotive
   # click element   ${Auto}
    click element    ${Section_Automotive_Link_Xpath}
    wait until element is visible   ${AutomotivePage_Banner_Text_Xpath}
    page should contain element  ${AutomotivePage_Banner_Text_Xpath}
    ${Auto}=  get text    ${AutomotivePage_Banner_Text_Xpath}
    log to console  ${Auto}
    Should Be Equal As Strings   ${Auto}  AUTOMOTIVE
