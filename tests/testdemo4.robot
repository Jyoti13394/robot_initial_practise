*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=../resources/data.csv  encoding=utf-8  dialect=unix
Resource    resource.robot
Documentation    To give parameters while running test
Test Setup    Open the browser with url
Test Template    Validate Unsuccessful login
*** Variables ***


*** Test Cases ***
Login with username ${username} and password ${password}    xyz     123456
#xyz and 123456 are default user name and password in case the csv data is corrupted


*** Keywords ***
Validate Unsuccessful login
	[Arguments]    ${username}     ${password}
    Fill the login form     ${username}     ${password}
    Wait until form is filled and success/error message is displayed

Fill the login form
	[Arguments]    ${username}     ${password}
	Input Text    username  ${username}
	Input Password    password  ${password}
	Click Button    css:input[type='submit']

Wait until form is filled and success/error message is displayed
	Wait Until Element Is Visible    css:div[class='alert alert-danger col-md-12']
	${error_message}=   Get Text    css:div[class='alert alert-danger col-md-12']
	Log     ${error_message}