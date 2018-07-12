*** Settings ***

Library	Screenshot
Library   robot.libraries.String
Library  Selenium2Library
*** Keywords ***

Generate Random Word    [Arguments]     ${textType}= NUMBERS

    ${RANUSER}=   Generate Random String  8       [${textType}]
    ${statement}=    Catenate   ROA_${RANUSER}TESTAUT
     [Return]    ${statement}