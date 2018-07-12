*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Library  Collections
Resource  ../Xpaths/SelectMarketXpath.robot
Resource  ../MarketData.txt
Resource  ../UtilityKeywords.robot

*** Variables ***

${landingPageURI}       http://startech-qa.ecentricarts.com/


*** Keywords ***

Iterate the markets from the external data       [Arguments]     @{lines}

    :FOR    ${line}    IN    @{lines}
     \    @{Data} =  Split String    ${line}    ,
     \    Log to console    ******************* Country : ${Data[0]} :::: Language Available : ${Data[1]} *******************
     \     Change the market based on the value from the dataSheet    ${Data[0]}     ${Data[1]}     ${Data[2]}      ${Data[3]}


Change the market based on the value from the dataSheet    [Arguments]     ${CountryName_ToChange}     ${isLanguageAvailable}  ${isLoginAvailable}  ${isCartAvailable}

    wait until element is visible  ${Nav_Market_button}
    LOG TO CONSOLE    ******************* Changing to ${CountryName_ToChange} *******************
    click element   ${Nav_Market_button}
    wait until element is visible  ${Nav_Market_dropdownList}    20

    #click element  //div[@class='utility-nav-bar']//*[@class='utility-markets__item']//a[contains(text(),'${CountryName_ToChange}')]

    ${runStatus}=   Run Keyword And Return Status   click element  //div[@class='utility-nav-bar']//*[@class='utility-markets__item']//a[contains(text(),'${CountryName_ToChange}')]
    ${currentURL}=  Get Location
    wait until element is visible  ${FooterWarehouseDataXpath}    20
    ${footerWarehouseData}=     get text    ${FooterWarehouseDataXpath}


    log to console  Warehouse data for ${CountryName_ToChange} : English
    log to console  ====================================================
    log to console  URL : ${currentURL}
    log to console  DATA : ${footerWarehouseData}
    log to console  Run Status : ${runStatus}
    log to console  ====================================================

    Check Login and Cart link is shown in homepage      English      ${isLoginAvailable}     ${isCartAvailable}
    RUN KEYWORD IF  '${isLanguageAvailable}'=='yes'  Change the market language based on the value from the dataSheet   ${CountryName_ToChange}    ${isLanguageAvailable}   ${isLoginAvailable}     ${isCartAvailable}
    reload page
    wait until element is visible  ${Nav_Market_button}

Change the market language based on the value from the dataSheet    [Arguments]     ${CountryName_ToChange}     ${isLanguageAvailable}      ${isLoginAvailable}     ${isCartAvailable}


     wait until element is visible  ${Nav_Market_Language_button}   20
     click element   ${Nav_Market_Language_button}
     wait until element is visible  ${Nav_Market_Language_dropdownList}     20
     ${LanglocatorsCount}=    Get Matching Xpath Count    ${Nav_Market_Language_DropDownValues}
     ${result}=       Create List

    :FOR   ${locator}   IN RANGE    1    ${LanglocatorsCount}+1

        \       ${name}=    Get Text    //ul[@id='language-list-stMLShd' and contains(@aria-hidden,'false')]/li[${locator}]/a
        \       Append To List  ${result}  ${name}

    Append To List  ${result}  English
    ${result}=     Remove Duplicates   ${result}

    :FOR   ${language}   in    @{result}
        \       reload page
        \       wait until element is visible  ${Nav_Market_Language_button}    20
        \       click element   ${Nav_Market_Language_button}
        \       wait until element is visible  ${Nav_Market_Language_DropDownValues}    20
        \       ${runStatus}=   Run Keyword And Return Status   click element  //div[@class='utility-nav-bar']//*[@class='utility-markets__item']//a[contains(text(),'${language}')]
        \       ${currentURL}=  Get Location
        \       wait until element is visible  ${FooterWarehouseDataXpath}    20
        \       ${footerWarehouseData}=     get text    ${FooterWarehouseDataXpath}

        \       log to console  URL and Warehouse data for ${CountryName_ToChange} : ${language}
        \       log to console  ===============================================================
        \       log to console  URL : ${currentURL}
        \       log to console  Warehouse Data : ${footerWarehouseData}
        \       log to console  Run Status : ${runStatus}
        \       log to console  isLoginAvailable : ${isLoginAvailable}
        \       log to console  isCartAvailable : ${isCartAvailable}
        \       log to console  ===============================================================


Check Login and Cart link is shown in homepage      [Arguments]     ${language}     ${isLoginAvailable}     ${isCartAvailable}

    sleep  3s
    Log To Console      Login avail ${isLoginAvailable} :${language}
    Run Keyword If   '${isLoginAvailable}' == 'yes' and '${language}' == 'English'  page should contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

    Run Keyword If   '${isLoginAvailable}' == 'yes' and '${language}' != 'English'  page should not contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

    #Run Keyword If  '${isLoginAvailable}' == 'no' and '${language}' == 'English'  page should contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

    #Run Keyword If  '${isLoginAvailable}' == 'no' and '${language}' != 'English'  page should not contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']


     Run Keyword If  '${isCartAvailable}' == 'yes' and '${language}' == 'English'  page should contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

     Run Keyword If  '${isCartAvailable}' == 'yes' and '${language}' != 'English'  page should not contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

     #Run Keyword If  '${isCartAvailable}' == 'no' and '${language}' == 'English'  page should contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

   # Run Keyword If  '${isCartAvailable}' == 'no' and '${language}' != 'English'  page should not contain element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']

