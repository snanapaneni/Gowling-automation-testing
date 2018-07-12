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
    wait until element is visible  //*[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_menu_TreeActionsPanel_btnNew']  20s
    click element   //*[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_menu_TreeActionsPanel_btnNew']
    Unselect Frame
    go to       http://startech-qa.ecentricarts.com/CMSModules/Content/CMSDesk/Edit/edit.aspx?nodeid=25&culture=en-US
    wait until element is visible  //*[@id='m_c_f_Summary_txtText']      20s
    ${OldProductName}=  get text   //*[@id='m_c_f_Summary_txtText']

    ${RANUSER}  Generate Random String  5  [LETTERS]
    ${RANUSER} =   Catenate    SEPARATOR=_  ${RANUSER}   TESTQA
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