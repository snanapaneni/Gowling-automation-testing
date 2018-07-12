*** Settings ***
Documentation    Suite description
Resource  ../Resources/Keywords/SiteLoginKeyword.robot
Library  Selenium2Library
Resource  ../Resources/Keywords/SmokeTestKeywords.robot
Resource  ../Resources/Keywords/CMS_PIMKeywords.robot
Resource  ../Resources/Keywords/CultureTranslationKeywords.robot
Library	Screenshot
Library   robot.libraries.String
Resource  ../Resources/Keywords/SelectMarketKeywords.robot
Suite Setup     open browser  http://startech-qa.ecentricarts.com/en-us/home-5  chrome
Suite Teardown  Close browser

Resource  ../Resources/Keywords/TranslationManagerCMSKeywords.robot

*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market
${srcProductID}     ARMBARTRIO
${srcvaluesToTranslate}       BrNRhIaQcr_TESTQA

*** Test Cases ***

Login CMS

    maximize browser window
    go to  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx
    Login CMS   ${userName}     ${password}
    Navigate to custom modules  Pages

##Create New Product Page

    ${productName}=   generate random word    UPPER
    log to console     the value is: ${productName}
    ${skuNmuber}=   generate random word    NUMBERS
    log to console     the value is: ${skuNmuber}
    go to  http://startech-qa.ecentricarts.com/CMSModules/Ecommerce/Pages/Tools/Products/Product_New.aspx?content=1&classid=5337&parentnodeid=153&parentculture=en-US
    wait until element is visible   //*[@id='m_em_menu_menu_HA_0']     30s
    select from list by value    //*[@id='m_c_productEditElem_g_STProductType_drpSingleSelect']     ST.VIDEO1
    input text  //*[@id='m_c_productEditElem_g_SKUName_txtText']    ${productName}
    input text  //*[@id='m_c_productEditElem_g_STSupplementaryName_cntrlContainer_textbox']     Test Automation Description
    input text      //*[@id='m_c_productEditElem_g_SKUNumber_txtText']      ${skuNmuber}
    click element   //*[@id='m_c_productEditElem_g_ctl04']
    click element   //*[@id='m_c_productEditElem_g_STHardCategory_CategoriesPanel']/button

    sleep  2s
    ${Length}=  Get window titles
    log to console   ${Length}
    select window  title=SimpleMasterPage
    wait until element is visible   //*[@id='categoryTree']/ul/li[1]/span[1]        30s
    click element  //*[@id='categoryTree']/ul/li[1]/span[1]
    wait until element is visible   //*[@id='categoryTree']/ul/li[2]/span[2]    20s
    click element   //*[@id='categoryTree']/ul/li[2]/span[2]
    wait until element is visible   //*[@id='categoryTree']/ul/li[3]    20s
    click element  //*[@id='categoryTree']/ul/li[3]
    click element  //*[@id='m_btnSaveAndClose']
    select window  Title=Product properties


    click element   //*[@id='m_c_productEditElem_g_STSoftCategories_CategoriesPanel']/button
    sleep  2s
    ${Length}=  Get window titles
    log to console   ${Length}
    select window  title=SimpleMasterPage
    click element  //*[@id='categoryTree']/ul/li/span[1]
    click element  //*[@id='categoryTree']/ul/li[2]/span[2]
    click element   //*[@id='categoryTree']/ul/li[3]/span[5]
    click element   //*[@id='m_btnSaveAndClose']
    select window  Title=Product properties
    click element   //*[@id='m_em_menu_menu_HA_0']
    ${uriEndPoint}=     Convert To Lowercase        ${productName}
    log to console      http://startech-qa.ecentricarts.com/en-us/products/${uriEndPoint}


    # Enable the marketplace

       go to  http://startech-qa.ecentricarts.com/StarTech/Modules/Market/Pages/EnableProductForMarkets.aspx
       wait until element is visible    //*[@id='txtSearchText']   30s
       input text   //*[@id='txtSearchText']    ${uriEndPoint}
       click element    //*[@id='sortable-object-m_c_frmSkuMarket_Products']/div/div[1]/ul[1]/li/span[2]/i
       wait until element is visible   //*[@id='sortable']/li[1]   30s
       sleep  2s
       click element    //*[@id='sortable-object-m_c_frmSkuMarket_Markets']/div/div[1]/ul[1]/li/span[2]/i
       wait until element is visible    //*[@id='sortable']/li[1]   30s
       click element  //*[@id='m_actionsElem_editMenuElem_menu_menu_HA_0']
       ${validationText}=   get text    //*[@id='m_pM_lS_lbl']
       should be equal as strings   The changes were saved.      ${validationText}


   # Verifing the product page details in US market
     go to  http://startech-qa.ecentricarts.com/en-us/products/${productName}
    ${productTitle}=    get text    //*[@id='main']/div[2]/div[1]/div/div/h1
    should be equal as strings      ${productTitle}     ${productName}
    ${productDesc}=     get text    //*[@id='main']/div[2]/div[1]/div/div/h2
    should be equal as strings       Test Automation Description        ${productDesc}
    ${productID}=   get text    //*[@id='main']/div[2]/div[1]/div/div/div/div[1]/p
    should be equal as strings      ${productID}     Product ID: ${skuNmuber}
    ${buyOption}=   get text    //*[@id='btn-where-to-buy']
    should be equal as strings      ${buyOption}       WHERE TO BUY
    ${accDetails}=  get text    //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button
    should contain    ${accDetails}          Your Account
    page should contain element     //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']        30s
    page should contain element     //div[@class='product-support']     30s
    page should contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkCreateAccount']     30s
    page should contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkRequestQuote']      30s



    # change culture into france and check the login functionality

    click element   //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button
    wait until element is visible   //*[@id='country-list-stMLShd']     60s
    click element   //*[@id='country-list-stMLShd']/li[8]/a
    sleep  2s
    page should not contain element     //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']        30s
    page should not contain element     //div[@class='product-support']     30s
    page should not contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkCreateAccount']     30s
    page should not contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkRequestQuote']      30s



    # change culture into europe and test the functionality

    click element   //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button
    wait until element is visible   //*[@id='country-list-stMLShd']     60s
    click element   //*[@id='country-list-stMLShd']/li[8]/a
    sleep  2s
    page should contain element     //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']        30s
    go to   http://startech-qa.ecentricarts.com/eu-es/products/${uriEndPoint}
    wait until element is visible   //*[@id='main']/div/div/div/h1      50s
    ${pageInfo}=    get text    //*[@id='main']/div/div/div/h1
    should be equal as strings      Page Not Found     ${pageInfo}



    #Ecommerce Enable

    go to   http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=5f1445ad-95c3-4006-9789-c0793ede3125&objectid=28&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']     60s
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_ncpcheckoutenabled']/span/label    60s
    click element   //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_ncpcheckoutenabled']/span/label
    click element   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    ${validationText}=   get text     //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lS_lbl']
    should be equal as strings   The changes were saved.      ${validationText}
    sleep  10s
    #validating in UI
    go to  http://startech-qa.ecentricarts.com/en-us/products/${productName}
    sleep  10s
    click element   //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button
    wait until element is visible   //*[@id='country-list-stMLShd']     60s
    click element   //*[@id='country-list-stMLShd']/li[18]/a
    sleep  2s
    page should contain element     //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']        30s
    #page should contain element     //div[@class='product-support']     30s
    page should contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkCreateAccount']     30s
    page should contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkRequestQuote']      30s



    #Ecommerce Disable

    go to   http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=5f1445ad-95c3-4006-9789-c0793ede3125&objectid=28&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']     60s
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_ncpcheckoutenabled']/span/label    60s
    Execute Javascript    window.document.evaluate("//*[@id='m_c_plc_lt_ctl01_Edit_EditForm_ncpcheckoutenabled']/span/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    click element   //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_ncpcheckoutenabled']/span/label
    click element   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    ${validationText}=   get text     //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lS_lbl']
    should be equal as strings   The changes were saved.      ${validationText}

    #validating in UI
    go to  http://startech-qa.ecentricarts.com/en-us/products/${productName}
    click element   //*[@id='form']/div[4]/header/div[1]/div/div[1]/div[1]/button
    wait until element is visible   //*[@id='country-list-stMLShd']     60s
    click element   //*[@id='country-list-stMLShd']/li[18]/a
    sleep  2s
    page should not contain element     //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkShoppingCart']        30s
    page should not contain element     //div[@class='product-support']     30s
    page should not contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkCreateAccount']     30s
    page should not contain element     //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl05_ST_ProductActions_lnkRequestQuote']      30s




