*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Library  robot.libraries.String


Library  stringpu.py
Library  Selenium2Library


*** Variables ***
${userName}     abharath
${password}     qwe123!@#
*** Keywords ***

Authentication Window
    open browser  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx  chrome
    input text into prompt  abharath
    input text into prompt  qwe321!@#
    Choose Ok On Next Confirmation

Login CMS   [Arguments]     ${userName}     ${password}

    wait until element is visible  //div[@id='Login1_pnlContainer']     20
    input text  //input[@id='Login1_UserName']  ${userName}
    input password  //input[@id='Login1_Password']  ${password}
    click button  //button[@id='Login1_LoginButton']
    wait until element is visible  //*[@id='m_c_layoutElem_h_Header_ss_ss']     20

Navigate to custom modules  [Arguments]  ${moduleName}

    wait until element is visible  //*[@id='cms-applist-toggle']/i  20
    click element  //*[@id='cms-applist-toggle']/i
    wait until element is visible  //*[@id='app_search']    20
    input text  //*[@id='app_search']   ${moduleName}
    RUN KEYWORD IF  '${moduleName}' == 'PIM'    wait until element is visible  //*[@id='collapse4605']/div/ul/li[7]/a   30s

    RUN KEYWORD IF  '${moduleName}' == 'PIM'    Click Element  //*[@id='collapse4605']/div/ul/li[7]/a

    RUN KEYWORD IF  '${moduleName}' == 'Pages'    wait until element is visible  //*[@id='collapse1167']/div/ul/li[12]/a    30s

    RUN KEYWORD IF  '${moduleName}' == 'Pages'    Click Element  //*[@id='collapse1167']/div/ul/li[12]/a

    RUN KEYWORD IF  '${moduleName}' == 'Categorization'    wait until element is visible  //*[@id='collapse4605']/div/ul/li[7]/a    30s

    RUN KEYWORD IF  '${moduleName}' == 'Categorization'    Click Element  //*[@id='collapse4605']/div/ul/li[7]/a

    wait until keyword succeeds     40s     2s      page should contain     ${moduleName}

navigate to PIM-Product type

    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
     wait until element is visible  //*[@id='TabLink_2']/span  20
    Execute Javascript  window.document.getElementById('TabLink_2').click;

    click element  //*[@id='TabLink_2']/span
    Execute Javascript  window.document.getElementById('TabLink_2').style.visibility = "visible";

    #wait until element is visible  //div[@class='UIHeader']//div/button     20

navigate to PIM-Field Groups

    wait until element is visible  //*[@id='TabLink_3']/span  20
    click element  //*[@id='TabLink_3']/span
    #wait until element is visible  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']     20

navigate to PIM-Fields

    wait until element is visible  //*[@id='TabLink_4']/span  20
    click element  //*[@id='TabLink_4']/span
    #wait until element is visible  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']     20

navigate to PIM-Presets

    wait until element is visible  //*[@id='TabLink_5']/span  20
    click element  //*[@id='TabLink_5']/span
    #wait until element is visible  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']     20

navigate to PIM - Unit of measure

    wait until element is visible  //*[@id='TabLink_6']/span  20
    click element  //*[@id='TabLink_6']/span
   # wait until element is visible  //*[@id='TabLink_0']/span     20

    wait until element is visible  //*[@id='TabLink_1']/span  20
    click element  //*[@id='TabLink_1']/span
    #wait until element is visible  //*[@id='TabLink_1']/span     20

Navigate To Markets - Regions

    #Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    #Execute Javascript  window.document.getElementById('TabLink_1').click;
    wait until element is visible  //*[@id='collapse4605']/div/ul/li[7]/a  20
    click element    //*[@id='collapse4605']/div/ul/li[7]/a      //13
   # wait until element is visible  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']     20

Navigate To Markets - Warehouse

    wait until element is visible  //*[@id='TabLink_2']/span  20
    click element  //*[@id='TabLink_2']/span
    #wait until element is visible  //*[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']     20


navigate to Cetegorization module

    #Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    #Execute Javascript  window.document.getElementById('TabLink_1').click;
    wait until element is visible  //*[@id='collapse4605']/div/ul/li[7]/a  20
    click element  //*[@id='collapse4605']/div/ul/li[7]/a
    #Execute Javascript  window.document.getElementById('TabLink_1').style.visibility = "visible";

   # wait until element is visible  //div[@class='UIHeader']//div/button     20


Add New Parent Hard Category
   # sleep  10s
   # Select Frame  //*[@id='aspnetForm']/div[4]//iframe
   # Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0').click;
   # wait until element is visible  //button[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']  20
   # click element  //button[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']
   # Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0').style.visibility = "visible";
    ${ret} =	Generate Random String  8   Hard[LOWER]TestQA
    log to console   ${ret}
    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a8a2f1d0-04b2-4510-bad8-69367792129a&displaytitle=false
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_DisplayName_cntrlContainer_textbox']      ${ret}
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_CodeName_txtCodeName']     ${ret}
    click element  //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']



Add New Child Hard Category
   # sleep  10s
   # Select Frame  //*[@id='aspnetForm']/div[4]//iframe
   # Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0').click;
   # wait until element is visible  //button[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']  20
   # click element  //button[@id='m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0']
   # Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl00_HeaderActions_headerElem_headerElem_HA_0').style.visibility = "visible";
    ${ret} =	Generate Random String  8   Hard[LOWER]ChildTestQA
    log to console   ${ret}
    go to  http://startech-qa.ecentricarts.com/CMSModules/AdminControls/Pages/UIPage.aspx?elementguid=a8a2f1d0-04b2-4510-bad8-69367792129a&displaytitle=false
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_DisplayName_cntrlContainer_textbox']      ${ret}
    input text      //*[@id='m_c_plc_lt_ctl01_Edit_EditForm_CodeName_txtCodeName']     ${ret}
    click element  //*[@id='m_c_plc_lt_ctl00_ObjectEditPanel_EditPanel_editMenuElem_menu_menu_HA_0']


Create Category Pages

    ${ret} =	Generate Random String  8   [LOWER]Test
    log to console   ${ret}
    go to   http://startech-qa.ecentricarts.com/Admin/CMSAdministration.aspx#95a82f36-9c40-45f0-86f1-39aa44db9a77
    sleep  5s
    Select Frame  //*[@id='aspnetForm']/div[4]//iframe
    ${val}=     get text  //*[@id='handle_314']/span[1]/span/span
    log to console   ${val}
    Open Context Menu       //*[@id='m_c_layoutElem']//div[@class='ContentMenuGroup']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree']//div[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_pnlTree']//a[@id='m_c_layoutElem_contentcontrolpanel_ContentNavigationPanel_layoutElem_tree_CMSDeskTree_t_tt0']
    wait until element is visible   //form[@id='aspnetForm']//div[@id='nodeMenu']//div[@id='m_mnodeMenu']//div[@id='m_mnodeMenu_contextMenuControl_pnlNodeMenu']//div[@id='m_mnodeMenu_contextMenuControl_iNew']/div/span   20s
    click element    //form[@id='aspnetForm']//div[@id='nodeMenu']//div[@id='m_mnodeMenu']//div[@id='m_mnodeMenu_contextMenuControl_pnlNodeMenu']//div[@id='m_mnodeMenu_contextMenuControl_iNew']/div/span

    go to   http://startech-qa.ecentricarts.com/CMSModules/Content/CMSDesk/Edit/Edit.aspx?action=new&classid=5369&parentnodeid=2&parentculture=en-US
    input text  //div[@class='editing-form-category-fields']//div[@id='field_PageName']//div[@id='m_c_f_ncppagename']/input     TestCategoryPage
    input text  //div[@class='editing-form-category-fields']//div[@id='field_Title']//div[@id='m_c_f_ncptitle']/input   TestCategoryPage
    input text  //div[@class='editing-form-category-fields']//div[@id='field_Summary']//div[@id='m_c_f_ncpsummary']/textarea    testSummary
    Execute Javascript    window.document.evaluate("//div[@id='m_c_f_Category_CategoriesPanel']/button", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    click element  //div[@id='m_c_f_Category_CategoriesPanel']/button
    sleep   3s
    select window  NEW
    wait until element is visible  //div[@id='m_pnlActions']//div[@class='header-actions-container']//div[@id='m_pa_pnlAdditionalControls']//input[@id='input-search']  20s
    input text  //div[@id='m_pnlActions']//div[@class='header-actions-container']//div[@id='m_pa_pnlAdditionalControls']//input[@id='input-search']     test1234
    click element  //*[@id='categoryTree']/ul/li[contains(@class,'list-group-item') and contains(@class,'node-categoryTree') and contains(@class,'search-result')]//span[4]
    click element  //div[@id='m_pnlFooterContent']//div[@id='divFooter']//button[@id='m_btnSaveAndClose']
    select window  MAIN


Add child category to parent category

    #close all browsers
    #open browser  http://startech-qa.ecentricarts.com/Admin/CMSAdministration.aspx#d7a3123e-84fc-41ee-818b-852a9640ee0c  chrome
    #maximize browser window
    #Login CMS   ${userName}     ${password}
    #wait until element is visible  //form[@id='aspnetForm']//div[@class='CMSDeskContent']//iframe   20s
    #Select Frame  //form[@id='aspnetForm']//div[@class='CMSDeskContent']//iframe
    #Execute Javascript  window.document.getElementById('TabLink_1').click;
    #click element  //*[@id='TabLink_1']/span
    #sleep  10s
    click element  //form[@id='aspnetForm']//div[@id='m_pnlBody']//div[@id='UIContent']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_pnlContent']//*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit']
    Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit').click;
    wait until element is visible  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit']/span  20
    click element  //*[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit']/span
    Execute Javascript  window.document.getElementById('m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v_ctl02_aedit').style.visibility = "visible";


    #wait until element is visible  //div[@id='m_pnlBody']//div[@id='UIContent']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[2]   20s
    ${value}=   get text  //div[@id='m_pnlBody']//div[@id='UIContent']//div[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem']//table[@id='m_c_plc_lt_ctl01_ST_UI_Listing_gridElem_v']//tr[1]//td[2]
    log to console  ${value}