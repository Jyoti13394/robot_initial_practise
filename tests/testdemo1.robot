*** Settings ***
Documentation    To Validate the login form
Library     SeleniumLibrary
Resource    resource.robot
Test Setup    Open the browser with url

*** Variables ***
${error_message_text}   css:.alert-danger
${Browser}  Chrome
${user_name}    rahulshettyacademy
${invalid_password}     12345678
${valid_password}   learning
${shop_button}  css:.btn-primary

*** Test Cases ***
Validate successful login
	Fill the login form     ${user_name}    ${invalid_password}
	Wait until element is located in page   ${error_message_text}
	Verify error/success message

Validate cards display in the shopping page
	Fill The Login Form     ${user_name}    ${valid_password}
	Click Button    id:signInBtn
	Wait until element is located in page    ${shop_button}

*** Keywords ***
Fill the login form
	[Arguments]    ${user_name}     ${password}
	Input Text    id:username   ${user_name}
	Input Password    id:password   ${password}
	Click Button    id:signInBtn

Wait until element is located in page
	[Arguments]    ${locator_of_element_to_wait_for}
	Wait Until Element Is Visible    ${locator_of_element_to_wait_for}

Verify error/success message
	#${result}=  Get Text    ${error_message_text}
	#Should Be Equal As Strings    ${result}     Incorrect username/password.
	Element Text Should Be    ${error_message_text}     Incorrect username/password.
