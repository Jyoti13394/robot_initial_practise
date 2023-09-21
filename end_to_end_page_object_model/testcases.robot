*** Settings ***
Documentation    All test cases
Library    SeleniumLibrary
Resource    generic_resources.robot
Resource    landingpage.robot
Resource    ShopPage.robot
Test Setup    Open Browser and Launch URL
#Test Template    Fill the login form in landing page with incorrect credential

*** Test Cases ***      user_name    password
#Invalid Username        djhdks      learning
#Invalid Password        rahulshetty     pjdlkjj
#Special Characters      ^$^djkjjf   %^8975
#Valid Credential        rahulshettyacademy      learning

Fill the login in form and proceed to shop page
	Fill the login form

Add Product to cart and checkout
	landingpage.Fill the login form
	Verify if you have proceeded to shop page
	Add an item to cart     ${card_name}


#*** Keywords ***
#Fill the login form in landing page with incorrect credential
	#[Arguments]    ${user_name}     ${password}
	#Validate unsuccesful login  ${user_name}     ${password}
