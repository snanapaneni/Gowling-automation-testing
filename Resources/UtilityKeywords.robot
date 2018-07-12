*** Settings ***
Library           robot.libraries.String
Library           OperatingSystem
Library           robot.api.logger
Library           Selenium2Library


*** Keywords ***
Read data from external source
    [Arguments]    ${sFileName}
    #Check that the given Excel Exists
    Log to console    ${sFileName}
    ${inputfileStatus}    ${msg}    Run Keyword And Ignore Error    OperatingSystem.File Should Exist    ${sFileName}
    Run Keyword If    "${inputfileStatus}"=="PASS"    info    ${sFileName} Test data file exist    ELSE    Fail    Cannot locate the given Excel file.
    ${value}=    Get File    ${sFileName}
    @{lines}=   split to lines    ${value}      1
    [Return]    @{lines}

