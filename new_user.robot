*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Library    BuiltIn
Resource    resources.robot
*** Variables ***
${shopurl}    http://automationpractice.com/index.php
${browser}         Chrome
${user_email}   test103@o2.pl
${invalid_user_email}   test103@o2.pl
${sing_in_button}  class:login
${email_field}      id:email_create
${create_account_button}    id:SubmitCreate
${mr_button}    id:id_gender1
${first_name}   Jan
${last_name}    Kowalski
${addres_field}     id:address1
${city_field}       id:city
${state_field}       id_state
${postcode_field}      id:postcode
${mobile_field}        id:phone_mobile
${first_name_field}    id:customer_firstname
${last_name_field}      id:customer_lastname
${password_field}       id:passwd
${short_password}       test
${password}         wsbstudent
${submit_button}       id:submitAccount
${days_field}       id:days
${months_field}     id:months
${years_field}      id:years
${addres}       586 Turnpike Rd New
${city}     New Ipswich
${state}    29
${postcode}     03071
${mobile}      555123456
${email_login}      id:email
${password_login}       id:passwd
${submit_login_button}      id:SubmitLogin
*** Test Cases ***
Test Registration
    [Tags]    New user registration
    Open shop main page
    Sign in page
    Enter a new email address
    Enter your personal information
    Enter address information
    Enter mobile phone
    Submit registration form
User login with an invalid email
    [Tags]      Invalid email login
    Open shop main page 2
    Sign in page 2
    Enter invalid email
    Enter valid password
    Submit login data 2
User login with an invalid email
    [Tags]      Invalid password login
    Open shop main page 3
    Sign in page 3
    Enter valid email
    Enter invalid password
    Submit login data 3
*** Keywords ***
Open shop main page
    Open Browser    ${shopurl}     ${browser}
Sign in page
    Click Element    ${sing_in_button}
Enter a new email address
    Input Text      ${email_field}      ${user_email}
    Click Element   ${create_account_button}
Enter your personal information
    Wait Until Element Is Visible   ${mr_button}
    Click Button   ${mr_button}
    Input Text     ${first_name_field}       ${first_name}
    Input Text     ${last_name_field}       ${last_name}
    Input Text     ${password_field}       ${short_password}
    Select From List By Value       ${days_field}       10
    Select From List By Value       ${months_field}     5
    Select From List By Value       ${years_field}      2005
Enter address information
    Input Text      ${addres_field}     ${addres}
    Input Text      ${city_field}       ${city}
    Select From List By Value       ${state_field}      ${state}
    Input Text      ${postcode_field}       ${postcode}
Enter mobile phone
    Input Text      ${mobile_field}     ${mobile}
Submit registration form
    Click Element      ${submit_button}
    #Wait Until Element Is Visible     class:alert alert-danger
    Close Browser
Open shop main page 2
    Open Browser    ${shopurl}     ${browser}
Sign in page 2
    Click Element    ${sing_in_button}
    Wait Until Element Is Visible   ${submit_login_button}
Enter invalid email
    Input Text      ${email_login}       ${user_email}
Enter valid password
    Input Text      ${password_login}       ${password}
Submit login data
    Click Button   ${submit_login_button}
    Close Browser
Open shop main page 3
    Open Browser    ${shopurl}     ${browser}
Sign in page 3
    Click Element    ${sing_in_button}
    Wait Until Element Is Visible   ${submit_login_button}
Enter valid email
    Input Text      ${email_login}       ${invalid_user_email}
Enter invalid password
    Input Text      ${password_login}       ${password}
Submit login data 3
    Click Button   ${submit_login_button}
    Close Browser