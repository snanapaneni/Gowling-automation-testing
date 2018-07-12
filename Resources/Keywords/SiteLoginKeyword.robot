*** Settings ***
Library  Selenium2Library
Resource  ../Xpaths/SiteLoginXpath.robot


*** Keywords ***

Navigate to login page from landing page

    wait until element is visible   //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button     40
    click element  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button
    wait until element is visible   //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkLogIn']   40
    click element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkLogIn']
   page should contain element   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_UserName']

Login with valid credentials    [Arguments]  ${userName}    ${password}

    wait until element is visible   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_UserName']   40
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_UserName']     ${userName}
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_Password']   ${password}
    click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_LoginButton']
    ${actualUserFirstName}=   get text  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button//span
    Should Be Equal As Strings  ${expectedUserFirstName}    ${actualUserFirstName}

LogOut the logged-in user

    wait until element is visible  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button  40
    click element  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button
    click element  //*[@id='p_lt_ctl00_HeaderUtilityTools_lnkSignOut_btnSignOutLink']
    wait until element is visible  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button//span    40
    ${actualLoggedOutName}=   get text  //*[@id='form']/div[4]/header/div[1]/div/div[2]/ul/li[2]/button//span
    Should Be Equal As Strings  ${expectedLoggedOutName}    ${actualLoggedOutName}


Click Login submit button

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_LoginButton']  40
    click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_LoginButton']


Enter UserName  [Arguments]  ${CredentialsValue}

    wait until element is visible   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_UserName']   40
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_UserName']     ${CredentialsValue}
    click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_LoginButton']

Enter wrong password    [Arguments]  ${CredentialsValue}

    wait until element is visible   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_Password']   40
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_Password']   ${CredentialsValue}
    click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_stLF_Login1_LoginButton']