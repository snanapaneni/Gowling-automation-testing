
*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library	Screenshot
Library   robot.libraries.String
Library     Collections

*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market
${srcProductID}     ARMBARTRIO
${srcvaluesToTranslate}       BrNRhIaQcr_TESTQA
${actualTextOver200}       Λορεμ ιπσθμ δολορ σιτ αμετ, qθοδ νεμορε ανιμαλ σεα ατ, ηισ τε αγαμ εραντ. Αδ νοβισ εθισμοδ εστ, εα νεc λιβρισ πηιλοσοπηια? Περ αν ιδqθε οπορτερε, εθ εοσ λεγενδοσ ερροριβθσ ιντελλεγατ! Αλβθcιθσ vολθπτaasdasd
${actualText200}        Λορεμ ιπσθμ δολορ σιτ αμετ, qθοδ νεμορε ανιμαλ σεα ατ, ηισ τε αγαμ εραντ. Αδ νοβισ εθισμοδ εστ, εα νεc λιβρισ πηιλοσοπηια? Περ αν ιδqθε οπορτερε, εθ εοσ λεγενδοσ ερροριβθσ ιντελλεγατ! Αλβθcιθσ vολθπτa


*** Keywords ***
Verify and Validate Advance search functionality

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltProductID_txtText']   20s
    input text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltProductID_txtText']  ${srcProductID}
    input text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltValueToTranslate_txtText']      ${srcvaluesToTranslate}
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_btnShow']
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[7]  20s
    ${valuesToTranslate}=   get text   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[7]
    ${prodID}=  get text   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[13]
    should be equal as strings      ${srcvaluesToTranslate}     ${valuesToTranslate}
    should be equal as strings      ${srcProductID}     ${prodID}


Translation Manager CMS UserFlow - Product page

    maximize browser window
    go to  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx
    Login CMS   ${userName}     ${password}
    Navigate to custom modules  Pages
    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    wait until element is visible  //form[@id='aspnetForm']//span[@id='m_c_layoutElem']//div[@class='ContentMenuGroup']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree']//div[@class='TreeAreaTree']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_pnlTree']//*[@id='treeSelectedNode']/span  20s
    click element   //*[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_menu_TreeActionsPanel_btnNew']
    Unselect Frame
    go to       http://startech-qa.ecentricarts.com/CMSModules/Ecommerce/Pages/Content/Product/Product_Edit_General.aspx?nodeid=163&culture=en-US
    wait until element is visible  //*[@id='m_c_p_g_SKUName_txtText']        20s
    ${OldProductName}=  get text   //*[@id='m_c_p_g_SKUName_txtText']

    ${RANUSER}  Generate Random String  10  [LETTERS]
    ${RANUSER} =   Catenate    SEPARATOR=_  ${RANUSER}   TESTQA
    ${productID}=   get text  //*[@id='m_c_p_g_SKUNumber_txtText']
    LOG TO CONSOLE      RANDONM STRING : ${RANUSER}
    input text  //*[@id='m_c_p_g_SKUName_txtText']    ${RANUSER}
    wait until element is visible  //*[@id='m_em_menu_menu_HA_0']       20s
    click element  //*[@id='m_em_menu_menu_HA_0']
    sleep   2s
    page should contain element     //div[@id='m_c_p_plcMessages_pMP']//div[@id='m_c_p_plcMessages_lS']//div[@id='m_c_p_plcMessages_lS_lbl']

    GO TO  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible  //body[@id='m_bodyElem']//form[@id='aspnetForm']//div[@id='m_pnlBody']//div[@id='UIContent']/div//*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]  20s
    ${TranlationContent}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]
    log to console  ${TranlationContent}
    ${RequestedBy}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[15]
    log to console  ${RequestedBy}
    should be equal as strings  ${TranlationContent}      ${RANUSER}
    should be equal as strings  ${RequestedBy}      Arun Bharath Krishnan


Verify and Validate Add project : Single Item

    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[1]/span/label
    select from list by value  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpScope']    0
    select from list by index  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpAction']     1
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_btnOk']
    sleep  2s
    ${Length}=  Get window titles
    log to console   ${Length}
    select window  title=SimpleMasterPage
    ${expectedPackageName}=     get text    //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[2]
    ${expectedLangName}=        get text    //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[3]
    click element  //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[1]/span/label
    click element  //*[@id='m_f_btnAddToPackage']
    page should contain element  //*[@id='m_pM_lS_lbl']
    click element  //*[@id='m_f_btnCancel']
    select window  Title=Modal UI Page
    ${packageName}=     get text   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]
    ${targetLang}=      get text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[10]
    should be equal as strings   ${packageName}     ${expectedPackageName}
    should be equal as strings   ${targetLang}      ${expectedLangName}


Verify and Validate Add project : Multiple Item

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltProductID_txtText']   20s
    Select From List By Index   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltValueToTranslate_drpCondition']  3
    input text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltValueToTranslate_txtText']  ${srcvaluesToTranslate}
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_btnShow']
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[7]  20s
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[1]/span/label
    sleep  1s
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[2]/td[1]/span/label
    select from list by value  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpScope']    0
    select from list by index  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpAction']     1
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_btnOk']

    ${Length}=  Get window titles
    log to console   ${Length}
    wait until keyword succeeds     60s     5s  select window  title=SimpleMasterPage
    ${expectedPackageName}=     get text    //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[2]
    ${expectedLangName}=        get text    //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[3]
    click element  //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[1]/span/label
    click element  //*[@id='m_f_btnAddToPackage']

    page should contain element  //*[@id='m_pM_lS_lbl']

    click element  //*[@id='m_f_btnCancel']
    select window  Title=Modal UI Page
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]     30s
    ${packageName}=     get text   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]
    ${targetLang}=      get text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[10]
    should be equal as strings   ${packageName}     ${expectedPackageName}
    should be equal as strings   ${targetLang}      ${expectedLangName}


Verify sorting based on package name

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]   30s
    ${packageNameBeforeSorting}=    get text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[2]/a       30s
    click element   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[3]/a
    sleep   5s
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]      30s
    ${packageNameAfterSorting}=     get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]
    should not be equal as strings      ${packageNameBeforeSorting}     ${packageNameAfterSorting}

Verify sorting based on creator

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[4]      30s
    ${creatorNameBeforeSorting}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[15]
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[4]/a      30s
    click element   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[15]/a
    sleep  5s
    wait until element is visible       //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[4]       30s
    ${creatorNameAfterSorting}=     get text        //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[15]
    should not be equal as strings      ${creatorNameBeforeSorting}     ${creatorNameAfterSorting}

Verify sorting based on language

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]      30s
    ${langNameBeforeSorting}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[10]
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[3]/a      30s
    click element   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/thead/tr/th[10]/a
    sleep  3s
    wait until element is visible       //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]       30s
    ${langNameAfterSorting}=     get text        //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[10]
    should not be equal as strings      ${langNameBeforeSorting}     ${langNameAfterSorting}

verify list of items added to the package after submission

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[7]      30s
    ${valueToTranslate}=    get text  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[7]
    click element   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[1]/span/label
    select from list by value  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpScope']    0
    select from list by index  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpAction']     1
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_btnOk']

    ${Length}=  Get window titles
    log to console   ${Length}
    wait until keyword succeeds     60s     5s  select window  title=SimpleMasterPage
    ${packageName}=     get text    //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[2]
    click element  //*[@id='m_c_translationPackageGrid_v']/tbody/tr[1]/td[1]/span/label
    click element  //*[@id='m_f_btnAddToPackage']
    page should contain element  //*[@id='m_pM_lS_lbl']
    click element  //*[@id='m_f_btnCancel']
    select window  Title=Modal UI Page
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]     30s
    go to  startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=26f8ac01-047e-43f3-a9f7-40a3897140b0&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]      30s
    input text      //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_filterForm_PackageName_txtText']       ${packageName}
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr/td[2]     30s
    click element   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit']
    wait until element is visible   //*[@id='TabLink_1']/span       30s
    click element   //*[@id='TabLink_1']/span
    @{items}=      get list items       //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr//td[2]
    log to console      ${items}
    List Should Contain Value    @{items}       ${valueToTranslate}


view un-translated packages

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=26f8ac01-047e-43f3-a9f7-40a3897140b0&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]      30s
    #click element   //ul[@id='tab_ST_TranslationManager_Packages_submenu']//*[@id='TabLink_0']/span
    page should contain element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]

view translated packages

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=694d22a3-066f-40cc-9511-97bd3a59fcbc&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]     30s
    #click element   //ul[@id='tab_ST_TranslationManager_Packages_submenu']//*[@id='TabLink_1']/span
    page should contain element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]

package Delete - Default (new) with no translation items

    go to  http://startech-qa.ecentricarts.com/Admin/CMSAdministration.aspx/default.aspx#0b794be8-8109-47db-989f-4b41560a8402
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_a_delete']     30s
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_a_delete']
    Handle Alert


Un-translated package - check for required fields

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=26f8ac01-047e-43f3-a9f7-40a3897140b0&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]  30s
    click element  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']
    wait until element is visible  //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']    30s
    click element   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    page should contain element   //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lE_lbl']
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_PackageName_txtText']      testQA_Automation
    click element       //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    page should contain element     //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lS_lbl']
    go to   http://startech-qa.ecentricarts.com/Admin/CMSAdministration.aspx/default.aspx#0b794be8-8109-47db-989f-4b41560a8402
    @{items}=   get list items  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr/td[2]
    list should contain value   @{items}    testQA_Automation


Un-translated package - display name should be unique

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=26f8ac01-047e-43f3-a9f7-40a3897140b0&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]  30s
    ${packageName}=     get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]
    click element  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']
    wait until element is visible  //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']    30s
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_PackageName_txtText']      ${packageName}
    click element   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    page should contain element   //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lE_lbl']


Un-translated package - display name can only hold upto 200 characters

    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=26f8ac01-047e-43f3-a9f7-40a3897140b0&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]  30s
    click element  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']
    wait until element is visible  //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']    30s
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_PackageName_txtText']
    click element   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']
    ${expectedText}=    get text    //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_PackageName_txtText']
    should not be equal as strings      ${expectedText}     ${actualText200}


edit un-translated package

    go to   http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=686c1994-63dd-4a5a-9342-b41e5bd3b161&objectid=43&displaytitle=false
    wait until element is visible   //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']      30s
    ${RANUSER}  Generate Random String  4  [LETTERS]
    ${RANUSER} =   Catenate    SEPARATOR=_  ${RANUSER}   TESTQA_PKN
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_PackageName_txtText']      ${RANUSER}
    select from list by index   //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_TargetLanguage_drpSingleSelect']     1
    ${language}=    get selected list value     //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_drpAction']
    select from list by value  //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_Priority_dropDownList']    2
    ${priority}=    get selected list value     //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_Priority_dropDownList']
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_Notes_txtText']     ${RANUSER}
    page should contain element     //*[@id='m_c_plc_lt_ctl01_MessagesPlaceholder_plcMess_lS_lbl']
    Verify edited un-related package    ${RANUSER}      ${language}         ${priority}

Verify edited un-related package  [Arguments]  ${RANUSER}   ${language}         ${priority}

    wait until element is visible   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[2]    30s
    @{items}=   get list items  .//*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr/td[2]
    list should contain value   @{items}    ${RANUSER}
    ${languageActual}=  get text   //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']/tbody/tr[1]/td[3]
    ${newShortLangName}=    set variable if     ${languageActual} == 'Fr'   French
    should be equal as strings      ${language}           ${newShortLangName}