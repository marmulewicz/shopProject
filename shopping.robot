*** Settings ***
Documentation
Library  SeleniumLibrary
Suite Setup  Prepare Env

*** Variables ***
${shopurl}  http://automationpractice.com/index.php
${browser}  Chrome
${sign_in_button}  class:login
${email_field}  id:email
${password_field}  id:passwd
${submit_login}  id:SubmitLogin
${login}  wsb@onet.pl
${password}  wsbstudent
${search}  id:search_query_top
${input_search}  dress
${submit_search}  name:submit_search
${add}  xpath://body/div[@id='page']/div[2]/div[1]/div[3]/div[2]/ul[1]/li[3]/div[1]/div[1]/div[1]/a[1]/img[1]
${size}  id:group_1
${color}  name:White
${cart}  name:Submit
${continue}  xpath://body[1]/div[1]/div[1]/header[1]/div[3]/div[1]/div[1]/div[4]/div[1]/div[2]/div[4]/span[1]/span[1]
${input_search1}  blouse
${blouse}  xpath://body/div[@id='page']/div[2]/div[1]/div[3]/div[2]/ul[1]/li[1]/div[1]/div[1]/div[1]/a[1]/img[1]
${checkout}  xpath://body[1]/div[1]/div[1]/header[1]/div[3]/div[1]/div[1]/div[4]/div[1]/div[2]/div[4]/a[1]/span[1]
${buy}  xpath://body[1]/div[1]/div[2]/div[1]/div[3]/div[1]/p[2]/a[1]/span[1]
${processAddress}  name:processAddress
${checkbox}  id:cgv
${processCarrier}  name:processCarrier
${pay}  class:bankwire
${confirm}  xpath://body/div[@id='page']/div[2]/div[1]/div[3]/div[1]/form[1]/p[1]/button[1]

*** Test Cases ***
Login
    Open shop main page
    Login
Add items to cart
    Search
    Add to Cart
    Next Search
    Add next to Cart
    Pay

*** Keywords ***
Prepare Env
    set screenshot directory    screenshots
Open shop main page
    Open Browser    ${shopurl}     ${browser}
    Maximize Browser Window
Login
    Wait Until Element Is Enabled    ${sign_in_button}
    Click Element   ${sign_in_button}
    Wait Until Element Is Enabled    ${email_field}
    Input Text    ${email_field}    ${login}
    Wait Until Element Is Enabled    ${password_field}
    Input Text    ${password_field}    ${password}
    Wait Until Element Is Enabled    ${submit_login}
    Click Button    ${submit_login}
Search
    Wait Until Element Is Enabled    ${search}
    Input Text    ${search}    ${input_search}
    Wait Until Element Is Enabled    ${submit_search}
    Click Button    ${submit_search}
Add to Cart
    Wait Until Element Is Enabled    ${add}
    Click Element   ${add}
    Wait Until Element Is Enabled     ${size}
    Select From List By Value   ${size}     2
    Wait Until Element Is Enabled    ${color}
    Click Element   ${color}
    Wait Until Element Is Enabled    ${cart}
    Click Element   ${cart}
    Sleep    2
    Wait Until Element Is Enabled    ${continue}
    Click Element   ${continue}
Next Search
    Wait Until Element Is Enabled    ${search}
    Input Text    ${search}    ${input_search1}
    Wait Until Element Is Enabled    ${submit_search}
    Click Button    ${submit_search}
Add next to Cart
    Wait Until Element Is Enabled    ${blouse}
    Click Element   ${blouse}
    Select From List By Value   ${size}     3
    Wait Until Element Is Enabled    ${cart}
    Click Element   ${cart}
    Sleep    2
    Wait Until Element Is Enabled    ${checkout}
    Click Element   ${checkout}
Pay
    Wait Until Element Is Enabled    ${buy}
    Click Element   ${buy}
    Wait Until Element Is Enabled    ${processAddress}
    Click Element   ${processAddress}
    Wait Until Element Is Enabled    ${checkbox}
    Click Element   ${checkbox}
    Wait Until Element Is Enabled    ${processCarrier}
    Click Element   ${processCarrier}
    Wait Until Element Is Enabled    ${pay}
    Click Element   ${pay}
    Wait Until Element Is Enabled    ${confirm}
    Click Element   ${confirm}
    Close Browser