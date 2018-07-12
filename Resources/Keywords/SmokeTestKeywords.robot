*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/AccountDetailsXpath.robot
Library	Screenshot
Library   robot.libraries.String
Library  Collections

*** Keywords ***
verify product selection
    wait until element is visible  //button[@class='primary-nav__link--products']   30s
    click element  //button[@class='primary-nav__link--products']
    page should contain element     //*[@id='product-navigation' and contains(@aria-hidden,'false')]

verify support selection
    wait until element is visible  //*[@id='supportNav']/div/button   30s
    click element  //*[@id='supportNav']/div/button
    page should contain element     //*[@id='support-navigation' and contains(@aria-hidden,'false')]

verify product subcategory and navigation

    wait until element is visible  //button[@class='primary-nav__link--products']   30s
    click element  //button[@class='primary-nav__link--products']
    page should contain element     //*[@id='product-navigation' and contains(@aria-hidden,'false')]
    wait until element is visible   //*[@id='prod-nav-index_1']
    click element  //*[@id='prod-nav-index_1']
    ${getValueData}=    get text  //*[@id='prod-nav-index_1']
    page should contain element  //div[@id='product-nav__panel_1' and contains(@aria-hidden,'false')]
    ${getSubcategoryData}=  get text  //*[@id='product-nav__panel_1']/h2
    should be equal as strings  ${getValueData}      ${getSubcategoryData}


verify support subcategory and navigation

    wait until element is visible  //*[@id='supportNav']/div/button   30s
    click element  //*[@id='supportNav']/div/button
    page should contain element     //*[@id='support-navigation' and contains(@aria-hidden,'false')]
    page should contain element  //*[@id='support-navigation']/div[1]
    ${header1Actual}=     get text  //*[@id='support-navigation']/div[1]/h2
    should be equal as strings  ${header1Actual}      Quick Links
    page should contain element  //*[@id='support-navigation']/div[2]
    ${header1Actual}=     get text  //*[@id='support-navigation']/div[2]/h2
    should be equal as strings  ${header1Actual}      Product Support
    page should contain element  //*[@id='support-navigation']/div[3]
    ${header1Actual}=     get text  //*[@id='support-navigation']/div[3]/h2
    should be equal as strings  ${header1Actual}      Sales and Ordering Support


verify Talk to Advisor hours

    wait until element is visible  //*[@id='form']/div[4]/header/div[3]/div/div/ul/li[1]   30s
    ${advisorTimings}=  get text  //*[@id='con-utility']/div[1]/p
    log to console   the valuue is ${advisorTimings}
    should contain  ${advisorTimings}      Sunday 9PM (ET) - Friday 9PM (ET)

verify Live Chat link

    page should contain element  //*[@id='con-utility']/div[2]/ul/li[1]/a   50s
    page should contain element  //*[@id='p_lt_ctl03_ST_HeaderContactSupport_lnkChatMain']  30s

verify Contact number
    page should contain element  //*[@id='con-utility']/div[2]/ul/li[2]/a   50s
    page should contain element  //*[@id='p_lt_ctl03_ST_HeaderContactSupport_lnkTelTollFreeMain']   50s

verify E-mail link

    page should contain element  //*[@id='con-utility']/div[2]/ul/li[4]/a   50s

verify logo redirection

    ${getUrl}=  get location
    wait until element is visible  //*[@id='p_lt_ctl01_ST_HeaderLogo_lnkHome']/picture/img  20s
    click element  //*[@id='p_lt_ctl01_ST_HeaderLogo_lnkHome']/picture/img
    wait until element is visible  //*[@id='p_lt_ctl01_ST_HeaderLogo_lnkHome']/picture/img  20s
    ${getCurrentUrl}=   get location
    should be equal as strings  http://startech-qa.ecentricarts.com/en-us/home-5   ${getCurrentUrl}

verify Default Market & Language

    close all browsers
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/  chrome
    wait until element is visible  //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button    30s
    ${getMarket}=   get text  //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button
    log to console  ${getMarket}
    should be equal as strings  ${getMarket}    current country : Canada


Select a Market with a single language only

    wait until element is visible  //span[@class='utility-markets__label']  20s
    ${value}=   Run Keyword And Return Status   element should be enabled   //span[@class='utility-markets__label']
    should be equal as strings  ${False}    ${value}

userName should not be null

    page should contain element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_rfvUserNameRequired']   30s
    ${getUserNameError}=   get text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_rfvUserNameRequired']
    should be equal as strings  ${getUserNameError}   Please enter a user name.

password should not be null

     page should contain element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_FailureText']   30s
     ${getPasswordError}=   get text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_FailureText']
     should be equal as strings  ${getPasswordError}   The Username or Password doesn't match our records.

Navigate to hardCategory page and verify

    wait until element is visible   //*[@id='prodNav']/div/button   20s
    click element  //*[@id='prodNav']/div/button
    wait until element is visible  //*[@id='prod-nav-index_1']  30s
    click element  //*[@id='prod-nav-index_1']
   page should contain element   //*[@id='product-nav__panel_1' and contains('aria-hidden',false)]


Navigate to SoftCategory page and verify

    wait until element is visible   //*[@id='prodNav']/div/button   20s
    click element  //*[@id='prodNav']/div/button
    wait until element is visible  //*[@id='prod-nav-index_1']  30s
    click element  //ul[@class='product-nav__list soft']//*[@id='prod-nav-index_12']
   page should contain element   .//*[@id='product-nav__panel_12' and contains('aria-hidden',falsea)]
