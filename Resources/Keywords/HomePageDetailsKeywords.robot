*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/HomePageDetailsXpath.robot
Library	Screenshot
Library   robot.libraries.String
#Library  stringpu.py


*** Keywords ***

Verify Global header - Global brand image

    wait until element is visible  ${globalBrandImageXpath}  20
    page should contain image  ${globalBrandImageXpath}


Verify Global header - Tagline image

    wait until element is visible   ${taglineImageXpath}    20
    page should contain image  ${taglineImageXpath}

Verify Global header - Search bar

    wait until element is visible   ${searcgBoxXpath}
    page should contain element     ${searcgBoxXpath}

Verify Global header - Search bar icon

    wait until element is visible   ${searchIconXpath}
    page should contain element  ${searchIconXpath}


Verify Primary Nav bar - Products tab

    wait until element is visible  ${productTabXpath}   20
    page should contain element  ${productTabXpath}

Verify Primary Nav bar - Support tab

    wait until element is visible  ${supportTabXpath}   20
    page should contain element  ${supportTabXpath}

Verify Primary Nav bar - Contact support tab

    wait until element is visible  ${contactSupportTabXpath}    20
    page should contain element  ${contactSupportTabXpath}

Verify Primary Nav bar - Live chat link & icon

    wait until element is visible  ${liveChatLinkIxonXpath}     20
    page should contain element  ${liveChatLinkIxonXpath}

Verify Primary Nav bar - Phone number link & icon

    wait until element is visible  ${phoneNumberLinkIconXpath}
    page should contain element  ${phoneNumberLinkIconXpath}



Verify Primary footer bar - Footer primary links

    wait until element is visible  ${footerPrimaryLinksXpath}    20
    xpath should match x times  ${footerPrimaryLinksXpath}  5

Verify Primary footer bar - Footer secondary heading

    wait until element is visible  ${footerSecondaryHeadingXpath}     20
    page should contain element  ${footerSecondaryHeadingXpath}
    xpath should match x times  ${footerSecondaryLinksListXpath}   5


Verify Primary footer bar - Footer secondary links

    wait until element is visible  ${footerSecondaryLinksXpath}    20
    page should contain element  ${footerSecondaryLinksXpath}
    xpath should match x times  ${footerSecondarynavLinksXpath}  4

Verify Primary footer bar - Footer social heading

    wait until element is visible  ${footerSocialHeadingXpath}    20
    page should contain element  ${footerSocialHeadingXpath}

Verify Primary footer bar - Footer social item links

    xpath should match x times  ${footerSocialItemLinksXpath}     4


Verify Footer utility bar - Privacy link

    page should contain element  ${footerPrivacyLinkXpath}

Verify Footer utility bar - Site Feedback link

    page should contain element  ${footerSiteFeedbackLinkXpath}

Verify Footer utility bar - Terms and conditions

    page should contain element     ${footerTerms&ConditionXpath}

Verify Footer utility bar - Site map

    page should contain element  ${footerSiteMapXpath}

Verify Footer utility bar - copyright text

    page should contain element  ${footerCopyRightXpath}