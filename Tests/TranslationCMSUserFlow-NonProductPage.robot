*** Settings ***
Documentation    Suite description
Resource  ../Resources/Keywords/SiteLoginKeyword.robot
Library  Selenium2Library
Resource  ../Resources/Keywords/SmokeTestKeywords.robot
Resource  ../Resources/Keywords/CMS_PIMKeywords.robot
Library	Screenshot
Library   robot.libraries.String
Resource  ../Resources/Keywords/SelectMarketKeywords.robot
Suite Setup     open browser  http://startech-qa.ecentricarts.com/en-us/home-5  chrome
Suite Teardown  Close browser

*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market

*** Test Cases ***

Navigate to Startech QA CMS Site and Login - Form Tab verification

    maximize browser window
    go to  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx
    Login CMS   ${userName}     ${password}
    Navigate to custom modules  Pages
    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    wait until element is visible  //form[@id='aspnetForm']//span[@id='m_c_layoutElem']//div[@class='ContentMenuGroup']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree']//div[@class='TreeAreaTree']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_pnlTree']//*[@id='treeSelectedNode']/span  20s
    click element   //*[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_menu_TreeActionsPanel_btnNew']
    Unselect Frame
    go to       http://startech-qa.ecentricarts.com/CMSModules/Content/CMSDesk/Edit/edit.aspx?nodeid=25&culture=en-US
    wait until element is visible  //*[@id='m_c_f_Summary_txtText']      20s
    ${OldProductName}=  get text   //*[@id='m_c_f_Summary_txtText']

    ${RANUSER}  Generate Random String  5  [LETTERS]
    ${RANUSER} =   Catenate    SEPARATOR=_  ${RANUSER}   TESTQA
    ${productID}=   get text  //*[@id='m_c_p_g_SKUNumber_txtText']
    Set Global Variable      ${RANUSER}
    Set Global Variable      ${productID}
    LOG TO CONSOLE      RANDONM STRING : ${RANUSER}
    input text  //*[@id='m_c_f_Summary_txtText']    ${RANUSER}
    click element  //*[@id='m_bc_m_menu_menu_HA_0']
    wait until element is visible  //*[@id='m_c_plcMess_lI_lbl']/a       20s
    ${responseMessage} =    get text   //*[@id='m_c_plcMess_lI_lbl']/a
    should be equal as strings   ${responseMessage}     View and prioritize translation items that have been added to the repository
    page should contain element     //*[@id='m_c_plcMess_lS_lbl']

    GO TO  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
    wait until element is visible  //body[@id='m_bodyElem']//form[@id='aspnetForm']//div[@id='m_pnlBody']//div[@id='UIContent']/div//*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]  20s
    ${TranlationContent}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]
    log to console  ${TranlationContent}
    ${RequestedBy}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[15]
    log to console  ${RequestedBy}
    should be equal as strings  ${TranlationContent}      ${RANUSER}
    should be equal as strings  ${RequestedBy}      Arun Bharath Krishnan

Navigate to Startech QA CMS Site and Login - page Tab verification
    maximize browser window
    go to  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx
    Login CMS   ${userName}     ${password}
    Navigate to custom modules  Pages
    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    wait until element is visible  //form[@id='aspnetForm']//span[@id='m_c_layoutElem']//div[@class='ContentMenuGroup']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree']//div[@class='TreeAreaTree']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_pnlTree']//*[@id='treeSelectedNode']/span  20s
    ${val} =     get text   //*[@id='treeSelectedNode']/span
    log to console  ${val}
    click element  //*[@id='handle_153']/span[1]/span/span
    Click Image     //*[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_tn40']/img
    click element   //*[@id='treeSelectedNode']/span
    Unselect Frame
    go to       http://startech-qa.ecentricarts.com/CMSModules/Ecommerce/Pages/Content/Product/Product_Edit_General.aspx?nodeid=163&culture=en-US
    wait until element is visible  //*[@id='m_c_p_g_SKUName_txtText']        20s
    ${OldProductName}=  get text   //*[@id='m_c_p_g_SKUName_txtText']
    ${RANUSER}  Generate Random String  10  [LETTERS]
    LOG TO CONSOLE      RANDONM STRING : ${RANUSER}
    input text  //*[@id='m_c_p_g_SKUName_txtText']    ${RANUSER}
    wait until element is visible  //*[@id='m_em_menu_menu_HA_0']       20s
    click element  //*[@id='m_em_menu_menu_HA_0']
    sleep   2s
    page should contain element     //div[@id='m_c_p_plcMessages_pMP']//div[@id='m_c_p_plcMessages_lS']//div[@id='m_c_p_plcMessages_lS_lbl']

    GO TO  http://startech-qa.ecentricarts.com//Admin/CMSAdministration.aspx/default.aspx#0b794be8-8109-47db-989f-4b41560a8402
    #select frame  //html//body//div[@class='CMSDeskContent']//iframe
    sleep   10s
    wait until element is visible  //body[@id='m_bodyElem']//form[@id='aspnetForm']//div[@id='m_pnlBody']//div[@id='UIContent']/div//*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]  20s
    ${val1}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[7]
    log to console  ${val1}
    ${val2}=    get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[15]
    log to console  ${val2}

