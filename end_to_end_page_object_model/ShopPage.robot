*** Settings ***
Documentation    All keywords and Variable from shop page
Library    SeleniumLibrary
Resource    generic_resources.robot

*** Variables ***
${page_element_locator}     css:.btn-primary
${card_name}    iphone X

*** Keywords ***
Verify if you have proceeded to shop page
	Wait Until Element Is Located On Page    ${page_element_locator}
	Title Should Be    ProtoCommerce

Add an item to cart
	[Arguments]    ${card_name}
	${elements}=    Get WebElements     css:.card-title
	${position}=    Set Variable    1
	FOR     ${val}      IN      @{elements}
		Exit For Loop If    '${val.text}' == '${card_name}'
		Log     ${val.text} selected
		${position}=    Evaluate    ${position} + 1
	END
	Click Button    xpath:(//*[@class = 'card-footer'])[${position}]/button
	Click Link    css:li.active a
