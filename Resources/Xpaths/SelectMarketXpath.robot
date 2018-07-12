*** Variables ***

${Nav_Market_button}    //div[@class='utility-nav-bar']//div[@class='utility-markets__control'][1]/button
${Nav_Market_dropdownList}  //ul[@id='country-list-stMLShd' and contains(@aria-hidden,'false')]
${Nav_Market_Language_button}   //div[@class='utility-nav-bar']//div[@class='utility-markets__control'][2]/button
${Nav_Market_Language_dropdownList}     //ul[@id='language-list-stMLShd' and contains(@aria-hidden,'false')]
${Nav_Market_Language_DropDownValues}   //ul[@id='language-list-stMLShd' and contains(@aria-hidden,'false')]/li/a
${FooterWarehouseDataXpath}      //*[@id='form']/div[4]/footer/div[2]/div/div[1]/div