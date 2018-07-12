*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/ProductDetailsPageXpath.robot
Library	Screenshot
Library   robot.libraries.String
#Library  stringpu.py

*** Variables ***

${start}    0
${end}  6

*** Keywords ***
The page title must be <product name - StarTech.com>
    ${getTitle}=    get title
    ${title}=       convert to lowercase  ${getTitle}
    wait until element is visible  ${productNameXpath}  20
    ${getProdName}=     get text  ${productNameXpath}
    ${productName1}=     Convert To Lowercase  ${getProdName}
    ${prodName} = 	Catenate 	${productName1} 	- startech.com

    Should Be Equal  ${prodName}    ${title}


Breadcrumbs - Back to results link should be available

      wait until element is visible  ${backToResultsXpath}   20
      page should contain element  ${backToResultsXpath}

Breadcrumbs - Home link should be available

      wait until element is visible  ${homeLinkXpath}   20
      page should contain element  ${homeLinkXpath}

Product name, which should match the heading text on class="product name"

    ${getProdHeadingName}=     get text  ${productNameXpath}
    ${productHeadingName}=     Convert To Lowercase  ${getProdHeadingName}
    ${getProdName}=     get text  ${productNameHeadingTextXpath}
    ${productName1}=     Convert To Lowercase  ${getProdName}
    Should Contain   ${productHeadingName}    ${productName1}

Product Details Page - Flag should present

    page should contain element  ${productFlagNewXpath}

Product Details Page - Product name should present

    page should contain element  ${productNameHeadingTextXpath}

Product Details Page - Product supplemental should present

    page should contain element  ${productSupplementalTextXpath}

Product Details Page - Product ID should present

    page should contain element  ${productIDXpath}


Product Details Page - Product review


    wait until page contains element  ${reviewRatingsContainerXpath}   20
    ${value}=   Run Keyword And Return Status   page should contain element     ${ratingStarIconXpath}
    run keyword if  '${value}' == 'True'   checkReviewCategory


checkReviewCategory

       ${value}=  get text  ${reviewCategoryXpath}
        @{words} =	Split String	${value}
        log to console  ${words[0]}
        Run Keyword Unless      ${start} < ${words[0]} < ${end}     Fail
        page should contain element  ${numberOfReviewsXpath}
        page should contain element     ${addReviewXpath}


Product Gallery - Product Image

        page should contain image  ${productImageXpath}
        page should contain element  ${productGalleryListXpath}
        page should contain button      ${chevronNext}
        page should contain button  ${zoomButtonXpath}

Product Price

    ${msrp}=  get text      //*[@id='main']/div[2]/div[2]/div/div[3]/div[1]/div/div/p[1]
    ${Actualmsrp}=    Strip String    ${msrp}
    should be equal as strings   ${Actualmsrp}     MSRP


    ${currencyValue}=   get text  ${productPriceXpath}
    ${currencyType}=    get text    //*[@id='main']/div[2]/div[2]/div/div[3]/div[1]/div/div/p[2]/span
    should be equal as strings  ${currencyValue}    $183.99USD


    page should contain element  ${checkMarkXpath}


    ${stockText}=  get text   ${productStockXpath}
    ${Actualstocktext}=    Strip String    ${stockText}
    should be equal as strings   ${Actualstocktext}     5700+ In Stock



    page should contain button  ${whereToBuyButtonXpath}


     ${ResellerPriceText}=  get text   ${resellerPriceLinkXpath}
    ${ActualResellerPriceText}=    Strip String    ${ResellerPriceText}
    should be equal as strings   ${ActualResellerPriceText}     Reseller Pricing: Create an Account

    page should contain element  ${createanAccountXpath}

    ${volumeOrderText}=  get text   ${volumeOrderXpath}
    ${ActualvolumeOrderText}=    Strip String    ${volumeOrderText}
    should be equal as strings   ${ActualvolumeOrderText}     Volume Order? Request a Quote


    page should contain element  ${requestQUoteXpath}

    ${supportOrderText}=  get text   ${downloadSupportHeadingTextXpath}
    ${ActualsupportOrderText}=    Strip String    ${supportOrderText}
    should be equal as strings   ${ActualsupportOrderText}     DOWNLOADS & SUPPORT


    ${supportContentText}=  get text   ${productSupportContentXpath}
    ${ActualsupportContentText}=    Strip String    ${supportContentText}
    should be equal as strings   ${ActualsupportContentText}     Find drivers, manuals, data sheets and FAQs related to this item.



    page should contain button  ${productSupportButtonXpath}
    page should contain element  ${overViewXpath}
    page should contain element  ${techSpecsXpath}
    page should contain element  ${accessoriesXpath}
    page should contain element  ${supportXpath}
    page should contain element  ${carouselSLideXpath}



    ${carouselslideText}=  get text   ${carouselProductFlagXpath}
    ${ActualcarouselslideText}=    Strip String    ${carouselslideText}
    should be equal as strings   ${ActualcarouselslideText}     NEW!


    page should contain element  ${carouselItemIdXpath}
    page should contain element  ${carouselProductItemNameXpath}


    ${carousel__titleText}=  get text   ${carouselTitleXpath}
    @{ActualcarouseltitleText}=     split string    ${carousel__titleText}    -
    ${value}=  Replace String  ${Actualcarousel__titleText[0]}  ${space}  ${empty}
    should contain   ${value}     Youmightalsolike
