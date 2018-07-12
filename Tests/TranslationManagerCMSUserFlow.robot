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

Resource  ../Resources/Keywords/TranslationManagerCMSKeywords.robot

*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market
${srcProductID}     ARMBARTRIO
${srcvaluesToTranslate}       BrNRhIaQcr_TESTQA

*** Test Cases ***

Navigate to Startech QA CMS Site and Login - Form Tab verification

   # Translation Manager CMS UserFlow - Product page
   maximize browser window
    go to  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx
    Login CMS   ${userName}     ${password}
    Navigate to custom modules  Pages
    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    wait until element is visible      //form[@id='aspnetForm']//span[@id='m_c_layoutElem']//div[@class='ContentMenuGroup']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree']//div[@class='TreeAreaTree']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_pnlTree']//*[@id='treeSelectedNode']/span  20s
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


Advanced search

    Verify and Validate Advance search functionality


Add to package : Single Item


    Verify and Validate Add project : Single Item


Add to package : Multiple Item  #bug

    Verify and Validate Add project : Multiple Item


Sort based on Package name, creator and language

    Verify sorting based on creator

    Verify sorting based on package name


    Verify sorting based on language


Verify list of items added to the package after submission

    verify list of items added to the package after submission


Package Management
    view un-translated packages
    view translated packages
    #package Delete - Default (new) with no translation items
    #package - Default (new) with 1 or more translation items AND user accepts to remove
    #package sent for translation (Should not be deleted)

create a new Un-translated package

    Un-translated package - check for required fields
    Un-translated package - display name should be unique
    Un-translated package - display name can only hold upto 200 characters

#filter un-translated and translated packages



edit un-translated package

    edit un-translated package


#add new language


#Add to package : Validations

   # go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a344e71d-2bf6-4935-87f1-72a1ade6f82e&displaytitle=false
   # wait until element is visible  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_cf_fltProductID_txtText']   20s
   # click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_btnOk']
   # page should contain element     //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_divMessages']
   # ${selectAddPackageActionText}=  get text    //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_ctrlMassActions_divMessages']
   # should be equal as strings      ${selectAddPackageActionText}       Please select an action first.
