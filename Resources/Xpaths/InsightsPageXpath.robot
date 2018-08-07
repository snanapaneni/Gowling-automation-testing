*** Settings ***

*** Variables ***

${Logo_Xpath}       //*[@id="logo"]
${MainNav_Insights_Xpath}   //*[@id="p_lt_ctl06_PrimaryNavigation_rptPrimaryNav_ctl03_ctl00_lnkNavItem"]
${Viewall_Insights_Xpath}   //*[@id="p_lt_ctl06_PrimaryNavigation_rptPrimaryNav_ctl03_ctl00_lnkPage"]
${InsightsPage_Banner_Text_Xpath}    //*[@id="content"]/section[1]/div/div/div/h1
${sort_by_Xpath}  //*[@id="filterSort"]
${Keyword_search_Xpath}   //*[@id="searchFilters"]/div/div[1]/div[2]/fieldset/h2/small
${Filter_by_Xpath}  //*[@id="searchFiltersHeading"]/small
${Article_checkbox_XPath}   //*[@id="p_lt_ctl07_pageplaceholder_p_lt_ctl02_GWLG_Search_Filters_ResourceType_filterList"]/li[1]/label/span
${Resource_card_Xpath}  //*[@id="searchResults"]/ul[1]/li[1]/article
${Resource_type_Xpath}  //*[@id="searchResults"]/ul[1]/li[2]/article/div/div[2]/span[1]


${Resource_card_content_Xpath}  //*[@id="searchResults"]/ul[1]/li[1]/article/div
${Resource_card_title_Xpath}    //*[@id="searchResults"]/ul[1]/li[2]/article/div/div[1]
${Resource_type_tag_Xpath}      //*[@id="p_lt_ctl07_pageplaceholder_p_lt_ctl01_ResourceDetail_lnkResourceType"]
${Resource_author_section_Xpath}   //*[@id="content"]/section[1]/div/div/div[2]/section[1]
${Resource_author_text_Xpath}   //*[@id="content"]/section[1]/div/div/div[2]/section[1]/div/div[1]/div/h2
