*** Settings ***
Library  Selenium2Screenshots
Library  Selenium2Library
Library  String
Library  DateTime
Resource  kapitalist_service.py

*** Variables ***
${loginLink}                     id=loginLink
${loginEmailField}               id=Email
${loginPasswordField}            id=Password
${submitButton}                  xpath=//*[@type="submit"]
#${loginEmail}                    qa_test@binka.me
#${telephone}                     +380630000000
${createTenderButton}            xpath=//* [text()="Створити закупівлю"]
#Тип тендеру - Допорогові закупівлі
${typeOfAdvertisementLink}       xpath=//* [text()="Допорогові закупівлі"]
${titleOfTenderField}            name="Title"
${descriptionOfTenderField}      name="Description"
#${awardCriteria}                name="AwardCriteria"
${turnOnPdvCheckBox}             id="Value_VATIncluded"
${questionStartDate}             id="EnquiryPeriod_StartDate_Local"
${questionEndDate}               id="EnquiryPeriod_EndDate_Local"
${tenderPeriodStartDate}         id="TenderPeriod_StartDate_Local"
${tenderPeriodEndDate}           id="TenderPeriod_EndDate_Local"
${saveButton}                    xpath=//* [@type="submit"]

*** Keywords ***
Підготувати дані для оголошення тендера
  [Arguments]  @{ARGUMENTS}
  Log Many  @{ARGUMENTS}
  [return]  ${ARGUMENTS[1]}


Підготувати клієнт для користувача
  [Arguments]  @{ARGUMENTS}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  ...      ${ARGUMENTS[0]} ==  username
  Open Browser   ${USERS.users['${ARGUMENTS[0]}'].homepage}   ${USERS.users['${ARGUMENTS[0]}'].browser}   alias=${ARGUMENTS[0]}
  Set Window Size   @{USERS.users['${ARGUMENTS[0]}'].size}
  Set Window Position   @{USERS.users['${ARGUMENTS[0]}'].position}
  Run Keyword If   '${ARGUMENTS[0]}' != 'Kapitalist_Viewer'   Вхід   ${ARGUMENTS[0]}


Login
  [Arguments]  ${username}
  Run Keyword And Ignore Error   Wait Until Page Contains Element    ${loginLink}         10
  Click Element                  ${loginLink}
  Run Keyword And Ignore Error   Wait Until Page Contains Element    ${loginEmailField}   10
  Input text                     ${loginEmailField}                  ${USERS.users['${username}'].login}
  Sleep  2
  Input text                     ${loginPasswordField}               ${USERS.users['${username}'].password}
  Click Button                   ${submitButton}
  Sleep  3

Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${file_path}=        local_path_to_file   TestDocument.docx
  ${prepared_tender_data}=  Get From Dictionary  ${ARGUMENTS[1]}                       data
  ${items}=         Get From Dictionary          ${prepared_tender_data}               items
  ${title}=         Get From Dictionary          ${prepared_tender_data}               title
  ${description}=   Get From Dictionary          ${prepared_tender_data}               description
  ${budget}=        Get From Dictionary          ${prepared_tender_data.value}         amount
  ${step_rate}=     Get From Dictionary          ${prepared_tender_data.minimalStep}   amount
  ${enquiry_period}=  Get From Dictionary        ${prepared_tender_data}               enquiryPeriod
  ${enquiry_period_end_date}=  kapitalist_service.convert_date_to_string  ${enquiry_period.endDate}
  ${tender_period}=  Get From Dictionary         ${prepared_tender_data}               tenderPeriod
  ${tender_period_start_date}=  kapitalist_service.convert_date_to_string  ${tender_period.startDate}
  ${tender_period_end_date}=  kapitalist_service.convert_date_to_string  ${tender_period.endDate}
  ${countryName}=   Get From Dictionary   ${prepared_tender_data.procuringEntity.address}       countryName
  ${item_description}=  Get From Dictionary       ${items[0]}                           description
  ${item_locality}=  Get From Dictionary          ${items[0].deliveryAddress}           locality
  ${delivery_end_date}=      Get From Dictionary  ${items[0].deliveryDate}              endDate
  ${delivery_end_date}=      kapitalist_service.convert_item_date_to_string  ${delivery_end_date}
  ${item_delivery_address_street_address}=  Get From Dictionary  ${items[0].deliveryAddress}  streetAddress
  ${item_delivery_postal_code}=  Get From Dictionary  ${items[0].deliveryAddress}       postalCode
  ${latitude}=      Get From Dictionary           ${items[0].deliveryLocation}          latitude
  ${longtitude}=    Get From Dictionary           ${items[0].deliveryLocation}          longitude
  ${cpv}=           Convert To String             "Картонки"
  ${cpv_id}=        Get From Dictionary           ${items[0].classification}            id
  ${cpv_id_1}=      Get Substring                 ${cpv_id}                             0   3
  ${dkpp_desc}=     Get From Dictionary           ${items[0].additionalClassifications[0]}   description
  ${dkpp_id}=       Get From Dictionary           ${items[0].additionalClassifications[0]}  id
  ${code}=          Get From Dictionary           ${items[0].unit}                      code
  ${quantity}=      Get From Dictionary           ${items[0]}                           quantity
  ${name}=          Get From Dictionary   ${prepared_tender_data.procuringEntity.contactPoint}       name

  Selenium2Library.Switch Browser     ${ARGUMENTS[0]}
  Wait Until Page Contains Element    ${createTenderButton}                               10
  Click Element                       ${createTenderButton}
  Sleep  3
  Click Element                       ${typeOfAdvertisementLink}
  Wait Until Page Contains Element    ${titleOfTenderField}                              10
  Input text                          ${titleOfTenderField}                              ${title}
  Input text                          ${descriptionOfTenderField}                        ${description}
#  Чел бокс для включення/відключення ПДВ
  Click Element                       ${turnOnPdvCheckBox}
#  Input text                          id=mForm:data:budget   ${budget}
#  Sleep  5
#  Input text                          id=mForm:data:step     ${step_rate}
  Input text                          ${questionEndDate}                                ${enquiry_period_end_date}
  Input text                          ${tenderPeriodStartDate}                          ${tender_period_start_date}
  Input text                          ${tenderPeriodEndDate}                            ${tender_period_end_date}
#  Click Element                       xpath=//*[@id='mForm:data:vat']/tbody/tr/td[1]//span
#  Click Element                       id=mForm:data:cKind_label
#  Click Element                       xpath=//div[@id='mForm:data:cKind_panel']//li[3]
#  Input text                          id=mForm:data:cCpvGr_input      ${cpv_id_1}
#  Wait Until Page Contains Element    xpath=.//*[@id='mForm:data:cCpvGr_panel']/table/tbody/tr/td[2]/span   10
  Click Element                       ${saveButton}