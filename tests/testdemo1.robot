*** Settings ***
Documentation    To Validate the login form
Library     SeleniumLibrary
Library     Collections
Resource    resource.robot
Test Setup    Open the browser with url

*** Variables ***
${error_message_text}   css:.alert-danger
${Browser}  Chrome
${user_name}    rahulshettyacademy
${invalid_password}     12345678
${valid_password}   learning
${shop_button}  css:.btn-primary
${mobile_name}  Nokia Edge

*** Test Cases ***
#Validate successful login
	#Fill the login form     ${user_name}    ${invalid_password}
	#Wait until element is located in page   ${error_message_text}
	#Verify error/success message

Validate cards display in the shopping page
	Fill The Login Form     ${user_name}    ${valid_password}
	Click Button    id:signInBtn
	Wait until element is located in page    ${shop_button}
	Verify card titles in the shop page
	Select the card     ${mobile_name}

Fill the form and navigate to child window
	Fill the login details and navigate to next window


*** Keywords ***
Fill the login details
	[Arguments]    ${user_name}     ${password}
    Input Text    id:username  ${user_name}
    Input Password     id:password   ${password}

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

Verify card titles in the shop page
	@{expected_list}=   Create List    iphone X     Samsung Note 8      Nokia Edge      Blackberry
	${elements}=    Get WebElements     css:.card-title
	@{actual_list}=     Create List
	FOR     ${val}      IN      @{elements}
		Log     ${val.text}
		Append To List    ${actual_list}    ${val.text}
    END
    Lists Should Be Equal   ${actual_list}   ${expected_list}

Select the card
	[Arguments]    ${card_name}
	${elements}=    Get WebElements     css:.card-title
	${position}=    Set Variable    1
	FOR     ${val}      IN      @{elements}
		Exit For Loop If    '${val.text}' == '${card_name}'
		Log     ${val.text} selected
		${position}=    Evaluate    ${position} + 1
	END
	Click Button    xpath:(//*[@class = 'card-footer'])[${position}]/button

Fill the login details and navigate to next window
    Fill the login details    ${user_name}    ${valid_password}
    Click Element   css:input[value='user']
    Wait Until Element Is Visible    css:div[class='modal-body']
    Click Element    css:button[class='btn btn-success']
    Click Button    css:button[class='btn btn-success']
    #Wait Until Element Is Not Visible    css:div[class='modal-body']
    Select From List By Value    css:select[class='form-control']   teach
    Select Checkbox    css:input[type='checkbox']