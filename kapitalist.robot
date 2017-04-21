*** Settings ***
Library  Selenium2Screenshots
Library  Selenium2Library
Library  String
Library  DateTime
Library  kapitalist_service.py
Library  DebugLibrary

*** Variables ***
# Для тесткейсів
${locator.tenderId}                                             xpath=//a[contains(@href, 'gov.ua/tender/')]
${locator.title}                                                css=[name="Title"]
${locator.description}                                          xpath=//*[@name="Description"]
${locator.value.amount}                                         css=[name="Value.Amount"]
${locator.value.currency}                                       css=[name="Value.Amount"]
${locator.value.valueAddedTaxIncluded}                          css=[name="Value.Amount"]
${locator.minimalStep.amount}                                   css=[name="lot.MinimalStep.Amount"]
${locator.procurementMethodType}                                css=[name="ProcurementMethodType"]
${locator.procuringEntity.name}                                 xpath=//*[@id="general"]/div/fieldset[1]/div[1]/div[1]/span[2]/a
${locator.tenderPeriod.startDate}                               xpath=//*[@name="TenderPeriod"]/span[1]
${locator.tenderPeriod.endDate}                                 xpath=//*[@name="TenderPeriod"]/span[2]
${locator.enquiryPeriod.startDate}                              xpath=//*[@name="EnquiryPeriod"]/span[1]
${locator.enquiryPeriod.endDate}                                xpath=//*[@name="EnquiryPeriod"]/span[2]
${locator.lots[0].title}                                        xpath=//*[@name="lot.Title"]
${locator.lots[0].description}                                  xpath=//*[@name="lot.Description"]
${locator.lots[0].value.amount}                                 xpath=//*[@name="lot.Value.Amount"]
${locator.lots[0].value.currency}                               xpath=//*[@name="lot.Value.Amount"]
${locator.lots[0].value.valueAddedTaxIncluded}                  xpath=//*[@name="lot.Value.Amount"]
${locator.lots[0].minimalStep.currency}                         xpath=//*[@name="lot.MinimalStep.Amount"]
${locator.lots[0].minimalStep.amount}                           xpath=//*[@name="lot.MinimalStep.Amount"]
${locator.lots[0].minimalStep.valueAddedTaxIncluded}            xpath=//*[@name="lot.MinimalStep.Amount"]
${locator.items[0].description}                                 xpath=//*[@name="item.Description"]
${locator.items[0].deliveryDate.startDate}                      xpath=//*[@name="item.DeliveryDate"]/span[1]
${locator.items[0].deliveryDate.endDate}                        xpath=//*[@name="item.DeliveryDate"]/span[2]
${locator.items[0].additionalClassifications[0].description}    css=[name="item.AdditionalClassifications"]
${locator.items[0].additionalClassifications[0].id}             css=[name="item.AdditionalClassifications"]
${locator.items[0].deliveryLocation.longitude}
${locator.items[0].deliveryAddress.postalCode}                  css=[name="item.DeliveryAddress.PostalCode"]
${locator.items[0].deliveryAddress.countryName}                 css=[name="item.DeliveryAddress.Country"]
${locator.items[0].deliveryAddress.region}                      css=[name="item.DeliveryAddress.Region"]
${locator.items[0].deliveryAddress.locality}                    css=[name="item.DeliveryAddress.Locality"]
${locator.items[0].deliveryAddress.streetAddress}               css=[name="item.DeliveryAddress.Street"]
${locator.items[0].classification.scheme}                       xpath=//*[contains(text(), "CPV")]
${locator.items[0].classification.id}                           css=[name="item.Classification"]
${locator.items[0].classification.description}                  css=[name="item.Classification"]
${locator.items[0].unit.name}                                   css=[name="item.Quantity"]
${locator.items[0].unit.code}                                   css=[name="item.Unit.Code"]
${locator.items[0].quantity}                                    css=[name="item.Quantity"]
${locator.questions[0].title}                                   xpath=//*[@name="question.Title"]
${locator.questions[0].description}                             css=[name="question.Description"]
${locator.questions[0].date}                                    css=[name="question.Date"]
${locator.questions[0].answer}                                  css=[name="question.Answer"]
# ${locator.bids}
${locator.cancellations[0].status}                              css=[name="Status"]
${locator.cancellations[0].reason}                              css=[name="cancellation.Reason"]
${locator.document.title}                                       xpath=//*[@data-guid]/a


# Вхід в кабінет
${loginLink}                     id=loginLink
${loginEmailField}               id=Email
${loginPasswordField}            id=Password
${submitButton}                  xpath=//*[@type="submit"]
${createTenderButton}            xpath=//*[@id="mainControl"]/a[2]
#Тип тендеру - Допорогові закупівлі
${typeOfAdvertisementLink}       xpath=//* [text()="Допорогові закупівлі"]
${tender.title}                  id=Title
${edit.description}                   id=Description
${turnOnPdvCheckBox}             id=Value_VATIncluded
${questionStartDate}             id=EnquiryPeriod_StartDate_Local
${questionEndDate}               id=EnquiryPeriod_EndDate_Local
${tenderPeriodStartDate}         id=TenderPeriod_StartDate_Local
${edit.tenderPeriod.endDate}          id=TenderPeriod_EndDate_Local
${saveButton}                    xpath=//*[@type="submit"]

#Вхід до кабінету
${personalCabinetButton}         xpath=//*[@id="logoutForm"]//li/a/span

# Додавання лоту
${addLot}                        xpath=//fieldset[2]/a[1]
${lotHeader}                     id=Title
${lotDescription}                id=Description
${lotValueAmount}                id=Value_Amount
${lotGuaranteeAmount}            id=Guarantee_Amount
${lotMinimalStepAmount}          id=MinimalStep_Amount
${lotSaveButton}                 xpath=//*[@type="submit"]

# Додавання айтему
${addItemButton}                 xpath=//fieldset[3]/a[1]
${CpvCodeList}                   xpath=//*[@id='accordionCPV']/div/div/h4/a
${searchCPV}                     id=Classification_search
${addCpvCode}                    id=03121100-6_anchor
${unitCode}                      xpath=//*[@id="UnitId_chosen"]/a/span    #xpath=//*[@class="chosen-single"]/span
${unitName}                      xpath=//*[@class="chosen-search"]/input
${unit.active.result}            xpath=//*[@calss="active-result"]
${unitQuantity}                  id=Quantity
${deliveryDateStartDateLocal}    id=DeliveryDate_StartDate_Local
${deliveryDateEndDateLocal}      id=DeliveryDate_EndDate_Local
${deliveryAddressCountry}        id=DeliveryAddress_Country
${DeliveryAddress.Region}        name=DeliveryAddress.Region_input
${DeliveryAddress.City}          id=DeliveryAddress_Locality
${DeliveryAddress_PostalCode}    id=DeliveryAddress_PostalCode
${DeliveryAddress_Street}        id=DeliveryAddress_Street
${item.deliveryAdress.longtitude}      id=DeliveryLocation_Longitude
${item.deliveryAdress.latitude}        id=DeliveryLocation_Latitude
${item.additional.classification}      id=AdditionalClassificationsSelectedId
${itemSaveButton}                xpath=//*[@type="submit"]

# Завантадення документу
${add.tender.document}           xpath=//a[contains(@href, '/addLot')]/following-sibling::fieldset//a
${tender.document.description}   id=Description
${uploadButton}                  id=Document
${tender.document.save.button}          css=[type="submit"]

#Пошук тендеру по идентифікатору
${tenderSearchButton}            xpath=//*[@id="mainControl"]/a[1]
${byTenderNumber}                xpath=//*[@class='row']/a[2]
${PrecurementNumber}             id=ProcurementNumber
${searchButton}                  id=search
${publicTenderButton}            xpath=//*[@type="submit"]

#Питання
${addQuestionButton}             xpath=//a[contains(@href, 'addQuestion')]
${QuestionTitle}                 id=Title
${QuestionDescription}           id=Description
${saveQuestionButton}            xpath=//*[@type="submit"]
${answer.button}                 xpath=//*[contains(@href, 'addAnswer')]
${answer.text.field}             id=Answer
${answer.save.button}            css=[type="submit"]

#Подання пропозиції
${bid_take_part_button}              xpath=//a[contains(@onclick, '/bids/_add')]
${bid_select_lot_checkbox}           xpath=//*[@class="cr"]
${bid_lot_value}                     css=input[id*="Value_Amount"]
${bid_add_document}                  id=files
${bid_approve_button}                xpath=//*[@type="submit"]
${bids.tab}                          xpath=//a[@href="#bids"]
${cancelation.bid}                   css=[title="Відмінити пропозицію"]
${edit.bid.button}                   xpath=//a[contains(@onclick, '/_edit')]



#Скасування тендеру
${delete.tender.button}          xpath=//*[@id="general"]/div/fieldset[1]/div[2]/a[2]
${tender.cancelation.reason}     id=Reason
${description.cancelation.file}   css=[name="DescriptionUploadFile"]
${cancelation.upload.file}       css=[name="UploadFile"]
${cancelation.submit.button}     css=[type="submit"]


*** Keywords ***

#Виконано
Підготувати дані для оголошення тендера
  [Arguments]    ${username}    ${tender_data}     ${role_name}
  ${tender_data}=    adapt_tender_data    ${tender_data}
  [Return]    ${tender_data}

#Виконано
Підготувати клієнт для користувача
  [Arguments]   ${username}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  ...      ${ARGUMENTS[0]} ==  username
  Open Browser   ${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${username}
  Set Window Size   @{USERS.users['${username}'].size}
  Set Window Position   @{USERS.users['${username}'].position}
  Run Keyword If   '${username}' != 'kapitalist_Viewer'   Вхід   ${username}
  Execute Javascript   $('#languageList a[onclick*="uk"]').click();

#Виконано
Вхід
  [Arguments]  ${username}
  Run Keyword And Ignore Error   Wait Until Page Contains Element    ${loginLink}         10
  Click Element                  ${loginLink}
  Run Keyword And Ignore Error   Wait Until Page Contains Element    ${loginEmailField}   10
  Input text                     ${loginEmailField}                  ${USERS.users['${username}'].login}
  Sleep  2
  Input text                     ${loginPasswordField}               ${USERS.users['${username}'].password}
  Click Button                   ${submitButton}
  Sleep  3

#Виконано
Змінити користувача
  [Arguments]  @{ARGUMENTS}
  Go to                          ${USERS.users['${ARGUMENTS[0]}'].homepage}
  Input text                     ${loginEmailField}                  ${USERS.users['${username}'].login}
  Sleep  2
  Input text                     ${loginPasswordField}               ${USERS.users['${username}'].password}
  Click Button                   ${submitButton}
  Sleep  3

#Виконано
Створити тендер
  [Arguments]   ${username}   ${tender_data}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data

  Set Global Variable      ${TENDER_INIT_DATA_LIST}    ${tender_data}
  ${items}=             Get From Dictionary     ${tender_data.data}               items
  ${title}=             Get From Dictionary     ${tender_data.data}               title
  ${description}=       Get From Dictionary     ${tender_data.data}               description
  ${budget}=            Get From Dictionary     ${tender_data.data.value}          amount
  ${step_rate}=         Get From Dictionary     ${tender_data.data.minimalStep}   amount
  ${items_title}=       Get From Dictionary     ${items[0]}                       description
  ${items_description}=   Get From Dictionary   ${items[0]}                       description
#  ${additionalClassifications_description}=   Get From Dictionary   ${tender_data.data.items[0].classifications.additionalClassifications[0]}   description
  ${quantity}=          Get From Dictionary     ${items[0]}                       quantity
  ${cpv}=               Get From Dictionary     ${items[0].classification}         id
  ${unit}=              Get From Dictionary     ${items[0].unit}                   name
  ${latitude}=          Get From Dictionary     ${items[0].deliveryLocation}      latitude
  ${longitude}=         Get From Dictionary     ${items[0].deliveryLocation}      longitude
  ${postalCode}=        Get From Dictionary     ${items[0].deliveryAddress}       postalCode
  ${streetAddress}=     Get From Dictionary     ${items[0].deliveryAddress}       streetAddress
  ${region}=            Get From Dictionary     ${items[0].deliveryAddress}       region
  ${countryName}        Get From Dictionary     ${items[0].deliveryAddress}       countryName
  ${locality}=            Get From Dictionary     ${items[0].deliveryAddress}     locality
  ${deliveryDate}=      Get From Dictionary     ${items[0].deliveryDate}          endDate
  ${deliveryDate}=      convert_date_to_format        ${deliveryDate}
  ${tenderPeriod}=      Get From Dictionary   ${tender_data.data}               tenderPeriod
  ${enquiry_end_date}=   get_all_dates   ${tender_data}         EndPeriod
  ${start_date}=         get_all_dates   ${tender_data}         StartDate
  ${end_date}=           get_all_dates   ${tender_data}         EndDate
  ${lots}                Get From Dictionary   ${tender_data.data}                   lots
  ${lot_title}           Get From Dictionary   ${lots[0]}                             title
  ${lot_desc}            Get From Dictionary   ${lots[0]}                             description
  ${lot_value_amount}    Get From Dictionary   ${lots[0].value}                       amount
  ${lot_step_rate}       Get From Dictionary   ${lots[0].minimalStep}                 amount

  Selenium2Library.Switch Browser     ${username}
  Wait Until Page Contains Element    ${createTenderButton}                               10
  Click Element                       ${createTenderButton}
  Sleep  3
  Click Element                       ${typeOfAdvertisementLink}
  Input text                          ${tender.title}                               ${title}
  Input text                          ${edit.description}                         ${description}
#  Чек бокс для включення/відключення ПДВ (при необхідності закоментувати)
  Click Element                       ${turnOnPdvCheckBox}
  Sleep  3
  Input text                          ${questionEndDate}                                ${enquiry_end_date}
  Sleep  3
  Input text                          ${tenderPeriodStartDate}                          ${start_date}
  Sleep  3
  Input text                          ${edit.tenderPeriod.endDate}                       ${end_date}
  Click Element                       ${saveButton}
#  Створена чернетка допорогового тендеру
  Sleep  1


# Додавання лоту
#Додати Предмет
  # Створити лот
  Wait Until Page Contains Element      ${addLot}
  click element                         ${addLot}
  Wait Until Page Contains Element      ${lotHeader}
  Input text                            ${lotHeader}                      ${lot_title}
  Input text                            ${lotDescription}                 ${lot_desc}
  Sleep  3
  Execute Javascript                    $('#Value_Amount').data("kendoNumericTextBox").value(${lot_value_amount});
  Execute Javascript                    $(${lotGuaranteeAmount}).data("kendoNumericTextBox").value(${lot_value_amount});
  Execute Javascript                    $(${lotMinimalStepAmount}).data("kendoNumericTextBox").value(${lot_step_rate});
  Click Element                         ${lotSaveButton}
  Sleep  3

# Додавання номенклатури Suite Setup
  Wait Until Page Contains Element     ${addItemButton}                  10
  Click Element                         ${addItemButton}
  Wait Until Page Contains Element      ${lotDescription}                 10
  Input Text                            ${lotDescription}                 ${items_description}
  Sleep  1
  Click Element                         ${cpvcodelist}
  Sleep  1
  Wait Until Element Is Visible         ${searchCPV}                      10
  Sleep  1
  Input Text                            ${searchCPV}                      ${cpv}
  Sleep  1
  Execute Javascript                    location.href = "#${cpv}_anchor";
  Click Element             id=${cpv}_anchor
  Sleep  1
  Run Keyword If   '${cpv}' == '99999999-9'
#  ...   Input Text   ${item.additional.classification}      ${additionalClassifications_description}
  ...   Input Text   ${item.additional.classification}      ДКПП
  Execute Javascript                    $('#UnitId_chosen>a>span').trigger({type: 'mousedown', which: 1});
  Input Text                            ${unitName}                       ${unit}
  Press Key                             ${unitName}                       \\\13
  Input Text                            ${unitQuantity}                   ${quantity}
  Input Text                            ${deliveryDateStartDateLocal}     ${deliveryDate}
  Input Text                            ${deliveryDateEndDateLocal}       ${deliveryDate}
  Execute Javascript                    $(${deliveryAddressCountry}).data("kendoComboBox").value("${countryName}");
  Input Text                            ${DeliveryAddress.Region}         ${region}
  Input Text                            ${DeliveryAddress.City}           ${locality}
  Input Text                            ${DeliveryAddress_PostalCode}     ${postalCode}
  Input Text                            ${DeliveryAddress_Street}         ${streetAddress}
  Click Element                         ${itemSaveButton}

  #Публікація тендеру
  Click Element                         ${publicTenderButton}
  Sleep  5
  wait until page contains element      xpath=//a[contains(@href, 'gov.ua/tender/')]
  ${tender_UAid}=  Get Text  xpath=//a[contains(@href, 'gov.ua/tender/')]
  Sleep  1
  ${tender_UAid}=  get_tender_id      ${tender_UAid}
  Log   ${tender_UAid}
  ${Ids}=   Convert To String         ${tender_UAid}
  log to console      ${Ids}
  Log   ${Ids}
  Run keyword if   '${mode}' == 'multi'   Set Multi Ids   ${username}   ${tender_UAid}
  [return]  ${Ids}

#Виконано
Додати предмет
  [Arguments]   ${items}   ${index}
  Wait Until Page Contains Element      ${addLot}
  click element                         ${addLot}
  Wait Until Page Contains Element      ${lotHeader}
  Input text                            ${lotHeader}                      ${title}
  Input text                            ${lotDescription}                 ${description}
  Sleep  3
  Execute Javascript                    $(${lotValueAmount}).data("kendoNumericTextBox").value(${budget});
  Execute Javascript                    $(${lotGuaranteeAmount}).data("kendoNumericTextBox").value(${budget});
  Execute Javascript                    $(${lotMinimalStepAmount}).data("kendoNumericTextBox").value(${step_rate});
  Click Element                         ${lotSaveButton}
  Sleep  3

Створити лот
  [Arguments]   ${username}   ${tender_uaid}   ${lot}   ${data}=${EMPTY}
  ${index}= 1
  Wait Until Page Contains Element      ${addLot}
  click element                         ${addLot}
  Wait Until Page Contains Element      ${lotHeader}
  Input text                            ${lotHeader}                      ${lot.title}
  Input text                            ${lotDescription}                 ${lot.description}
  Sleep  3
  Execute Javascript                    $(${lotValueAmount}).data("kendoNumericTextBox").value(${lot.value.amount});
  Execute Javascript                    $(${lotGuaranteeAmount}).data("kendoNumericTextBox").value(${lot.value.minimalStep.amount});
  Execute Javascript                    $(${lotMinimalStepAmount}).data("kendoNumericTextBox").value(${step_rate});
  Click Element                         ${lotSaveButton}
  Sleep  3

#Виконано
Завантажити документ
  [Arguments]     ${user_name}   ${path}   ${tender_id}
  kapitalist.Пошук тендера по ідентифікатору   ${user_name}   ${tender_id}
  Sleep   2
  Wait Until Page Contains Element             ${add.tender.document}
  Click Element                                ${add.tender.document}
  Input Text                                   ${tender.document.description}  Test_document
  Choose File                                  ${uploadButton}   ${path}
  Sleep             2
  Click Element                                ${tender.document.save.button}
  Reload Page

#Виконано
Пошук тендера по ідентифікатору
  [Arguments]     ${user_name}   ${tender_UAID}
  Switch Browser                    ${user_name}
  Go to                             ${USERS.users['${user_name}'].homepage}
  Wait Until Page Contains Element  ${tenderSearchButton}                           5
  Click Element                     ${tenderSearchButton}
  Wait Until Page Contains Element  ${byTenderNumber}                               5
  Click Element                     ${byTenderNumber}
  Wait Until Page Contains Element  ${PrecurementNumber}
  Input Text                        ${PrecurementNumber}                        ${tender_UAID}
  Click Element                     ${searchButton}
  Sleep   3
  Wait Until Page Contains Element    xpath=//*[@id="tender-table"]//a    10
  Click Link                          xpath=//*[@id="tender-table"]//a
  sleep  1

#Виконане
Перейти до сторінки запитань
  Wait Until Page Contains Element   ${addQuestionButton}
  Click Element                      ${addQuestionButton}
  Wait Until Page Contains Element   ${QuestionTitle}           10

#Не виконане програмістами
Перейти до сторінки відмін
  Wait Until Page Contains Element   id=cancels_ref
  Click Element     id=cancels_ref
  Wait Until Element Contains  id=records_shown      Y

# виконане
Задати питання
  [Arguments]   ${username}   ${tenderUaId}   ${questionId}
  ${title}=        Get From Dictionary  ${questionId.data}  title
  ${description}=  Get From Dictionary  ${questionId.data}  description
  kapitalist.Перейти до сторінки запитань
  Sleep   3
  Input text          ${QuestionTitle}                 ${title}
  Input text          ${QuestionDescription}           ${description}
  Click Element       ${saveQuestionButton}
  Sleep  3
  Reload Page

# виконане
Скасувати закупівлю
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = tenderUaId
  ...      ${ARGUMENTS[2]} = cancellation_reason
  ...      ${ARGUMENTS[3]} = doc_path
  ...      ${ARGUMENTS[4]} = description
  kapitalist.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}       ${ARGUMENTS[1]}
  Wait Until Page Contains Element   ${delete.tender.button}
  Click Element                      ${delete.tender.button}
  Sleep   2
  Input text                         ${tender.cancelation.reason}      ${ARGUMENTS[2]}
  Input text                         ${description.cancelation.file}   ${ARGUMENTS[4]}
  Sleep  3
  Choose File                        ${cancelation.upload.file}        ${ARGUMENTS[3]}
  Sleep   2
  Click Element     ${cancelation.submit.button}
  Sleep   2
  Reload Page

# виконане
Отримати інформацію про cancellations[0].status
  # Перейти до сторінки відмін
  ${return_value}=Отримати текст із поля і показати на сторінці    cancellations[0].status
  [return]           ${return_value}

# виконане
Отримати інформацію про cancellations[0].reason
  # Перейти до сторінки відмін
  ${return_value}=Отримати текст із поля і показати на сторінці    cancellations[0].reason
  [return]           ${return_value}

Оновити сторінку з тендером
  [Arguments]    @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  Switch Browser    ${ARGUMENTS[0]}
  kapitalist.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}    ${ARGUMENTS[1]}

Отримати інформацію із предмету
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  item_id
  ...      ${ARGUMENTS[3]} ==  field_name
  ${return_value}=  Run Keyword And Return  kapitalist.Отримати інформацію із тендера  ${username}  ${tender_uaid}  ${field_name}
  [return]           ${return_value}

Отримати інформацію із лоту
  [Arguments]   ${username}   ${tender_uaid}   ${lot_id}   ${field_name}
  [Documentation]
  ...   Отримати значення поля field_name з лоту з lot_id в описі для тендера tender_uaid.
  ${return_value}=  Run Keyword  Отримати інформацію про lots[0].${field_name}
  [Return]  ${return_value}

# Виконано
Отримати інформацію із тендера
  [Arguments]  ${username}     ${tender_data}    ${fieldname}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  fieldname
  # ${return_value}=  run keyword  kapitalist.Отримати інформацію про ${fieldname}
  # [return]           ${return_value}
  # Switch browser  ${username}
  ${return_value}=  Run Keyword  Отримати інформацію про ${fieldname}
  [Return]  ${return_value}

# Виконано
Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]           ${return_value}

# Виконано
Отримати інформацію про title
  ${return_value}=   kapitalist.Отримати текст із поля і показати на сторінці   title
  [return]           ${return_value}

# Виконано
Отримати інформацію про procurementMethodType
  ${return_value}=   Отримати текст із поля і показати на сторінці   procurementMethodType
  [return]           ${return_value}

Отримати інформацію про eligibilityCriteria
  ${return_value}=   Отримати текст із поля і показати на сторінці   eligibilityCriteria

Отримати інформацію про status
  Reload Page
  Wait Until Page Contains Element      xpath=//*[@name="Status"]
  Sleep   2
  ${return_value}=   Get Element Attribute   xpath=//*[@name="Status"]@data-key
  [return]           ${return_value}

# Виконано
Отримати інформацію про description
  ${return_value}=   kapitalist.Отримати текст із поля і показати на сторінці   description
  [return]           ${return_value}

# Виконано
Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
  ${return_value}=   Convert to Number   ${return_value.split(' ')[0].replace(',', '.')}
#  ${return_value}=      ${return_value.split(' ')[0].replace(',', '.')}
  # ${return_value}=   string_to_float   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   convert to number   ${return_value.split(' ')[0].replace(',', '.')}
  [return]           ${return_value}

# Виконано
Внести зміни в тендер
  [Arguments]   ${username}   ${tender_uaId}   ${field_name}   ${field_value}
   [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  ${field_value}
  Selenium2Library.Switch Browser    ${username}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaId}
  Sleep   2
  Click Element   xpath=//*[@id="general"]/div/fieldset[1]/div[2]/a[1]
  Sleep   2
  Input Text        ${edit.${field_name}}         ${field_value}
  Click Element     css=[type="submit"]
  Sleep   3
  ${result_field}=   run keyword  kapitalist.Отримати інформацію про ${field_name}
  ${result_field}=   Run Keyword If   '${field_name}' == 'tenderPeriod.endDate'
  ...   convert_date_to_format   ${field_value}
  # ...   ELSE   ${field_value}
  # ...   Should Be Equal   ${result_field}   convert_date_to_format   ${field_value}
  # Should Be Equal   ${result_field}    ${field_value}

# Виконано
Отримати інформацію про items[${index}].quantity
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].quantity
  ${return_value}=   Convert to Number   ${return_value.split(' ')[0].replace(',', '.')}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[${index}].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.code
  ${return_value}=   Convert To String     ${return_value}
  [return]  ${return_value}

# Виконано
Отримати інформацію про items[${index}].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.name
  [return]           ${return_value.split(' ')[1]}

# Done
Отримати інформацію про items[${index}].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].description
  [return]           ${return_value}

####################################################################################
####################################  ЛОТИ  ########################################
####################################################################################

#Done
Отримати інформацію про lots[${index}].title
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].title
  [return]           ${return_value}


Отримати інформацію про lots[0].value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].value.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0].replace(',', '.')}
  [return]           ${return_value}

Отримати інформацію про lots[0].minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].minimalStep.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0].replace(',', '.')}
  [return]           ${return_value}

Отримати інформацію про lots[0].value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].value.currency
  ${return_value}=   convert_string_to_common_string   ${return_value.split(' ')[1]}
  [return]           ${return_value}

Отримати інформацію про lots[0].minimalStep.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].minimalStep.currency
  ${return_value}=   convert_string_to_common_string   ${return_value.split(' ')[1]}
  [return]           ${return_value}

Отримати інформацію про lots[0].value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці        value.valueAddedTaxIncluded
  ${return_value}=   Remove String      ${return_value}    ${return_value.split(' ')[0]+' UAH '}
  ${return_value}=   convert_string_to_common_string      ${return_value}
  [return]  ${return_value}

Отримати інформацію про lots[0].minimalStep.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці        lots[0].minimalStep.valueAddedTaxIncluded
  ${return_value}=   Remove String      ${return_value}    ${return_value.split(' ')[0]+' UAH '}
  ${return_value}=   convert_string_to_common_string      ${return_value}
  [return]  ${return_value}


Отримати інформацію про lots[${index}].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   lots[0].description
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[${index}].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.id
  [return]           ${return_value.split(' ')[0]}

# Дода
Отримати інформацію про items[${index}].classification.scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.scheme
  ${return_value}=   Remove String     ${return_value.split('(')[1]}     ):
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[${index}].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.description
  ${return_value}=   remove_first_word     ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці        value.currency
  ${return_value}=   convert_string_to_common_string   ${return_value.split(' ')[1]}
  [return]           ${return_value}

# Виконано
Отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці        value.valueAddedTaxIncluded
  ${return_value}=   Remove String      ${return_value}    ${return_value.split(' ')[0]+' UAH '}
  ${return_value}=   convert_string_to_common_string      ${return_value}
  [return]  ${return_value}

# Виконано
Отримати інформацію про tenderID
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  ${return_value}    get_tender_id   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [return]           ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
  # ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryLocation.latitude
  # ${return_value}=   Convert To Number   ${return_value}
  # [return]           ${return_value}
  Log        |Not added yet     console=yes

Отримати інформацію про items[0].deliveryLocation.longitude
  # ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryLocation.longitude
  # ${return_value}=   Convert To Number   ${return_value}
  # [return]           ${return_value}
  Log        |Not added yet     console=yes

# Виконано
Отримати інформацію про tenderPeriod.startDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про tenderPeriod.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   enquiryPeriod.startDate
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   enquiryPeriod.endDate
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.postalCode
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.region
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.locality
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.streetAddress
  [return]           ${return_value}

# Внесені правки
Отримати інформацію про items[0].deliveryDate.startDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   items[0].deliveryDate.endDate
  ${return_value}=     get_time_with_offset   ${return_value}
  [return]           ${return_value}

  # Внесені правки
Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   items[0].deliveryDate.endDate
  ${return_value}=     get_time_with_offset   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про questions[0].title
  Execute Javascript                    location.href = "[name='question.Title']";
  Sleep  5
  Wait Until Page Contains Element    ${locator.questions[0].title}
  ${return_value}=   Get Text   ${locator.questions[0].title}
  [return]           ${return_value}

# Виконано
Отримати інформацію про questions[0].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].description
  [return]           ${return_value}

# Виконано
Отримати інформацію про questions[0].answer
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].answer
  [return]           ${return_value}

# Виконано
Отримати інформацію про questions[0].date
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].date
  ${return_value}=   convert_date_to_format   ${return_value}
  [return]           ${return_value}


#Done
Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field_name}
  ${return_value}=  Отримати текст із поля і показати на сторінці   document.${field_name}
  [return]   ${return_value}

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element   xpath=//*[@data-guid]/a[contains(text(), '${doc_id}')]
  sleep   3
  ${file_name}=   Get Text    xpath=//*[@data-guid]/a[contains(text(), '${doc_id}')]
  ${url}=   Get Element Attribute    xpath=//*[@data-guid]/a[contains(text(), '${doc_id}')]@href
  download_document_from_url   ${url}   ${file_name}   ${OUTPUT_DIR}
  [return]  ${file_name}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  Reload Page
  ${return_value}=  Get Text   ${locator.questions[0].${field_name}}
  [return]           ${return_value}

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Задати питання   ${username}    ${tender_uaid}     ${question}


#Виконано
Відповісти на запитання
  [Arguments]    ${username}   ${tender_uaid}    ${answer_data}   ${item_id}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Page Contains Element      ${answer.button}
  Click Element                         ${answer.button}
  Input Text                            ${answer.text.field}                     ${answer_data.data.answer}
  Click Element                         ${answer.save.button}
  sleep   1

Подати цінову пропозицію
  [Arguments]   ${username}    ${tender_id}   ${test_bid_data}   ${lots_ids}=${None}   ${features_ids}=${None}
  ${amount}=    Get From Dictionary     ${test_bid_data.data.lotValues[0].value}         amount
  kapitalist.Пошук тендера по ідентифікатору    ${username}  ${tender_id}
  Wait Until Page Contains Element          ${bids.tab}
  Click Element                             ${bids.tab}
  Sleep   5
  Click Element                             ${bid_take_part_button}
  Sleep   5
  Wait Until Page Contains Element          ${bid_select_lot_checkbox}
  Click Element                             ${bid_select_lot_checkbox}
  Sleep   5
  Execute Javascript                        $('input[id*="Value_Amount"]').data("kendoNumericTextBox").value(${amount});
  Click Element                             ${bid_approve_button}
  sleep   3


Скасувати цінову пропозицію
  [Arguments]    ${user_name}   ${tender_id}
.. Log Many
  kapitalist.Пошук тендера по ідентифікатору  ${user_name}  ${tender_id}
  Wait Until Page Contains Element   ${bids.tab}
  Click Element       ${bids.tab}
  Sleep   3
  Wait Until Page Contains Element   ${cancelation.bid}
  Click Element       ${cancelation.bid}
  Wait Until Page Contains Element   ${cancelation.bid}
  Click Element   css=[type="submit"]

#Done
Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element            ${bids.tab}
  Click Element                               ${bids.tab}
  Sleep   3
  ${value}=   Get Text     css=[name="lotValue.Value"]
  ${value}=   Convert To Number      ${value.split(' ')[0].replace(',', '.')}
  [Return]    ${value}

Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  kapitalist.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Sleep   5
  Wait Until Page Contains Element            ${bids.tab}
  Click Element                               ${bids.tab}
  Sleep  5
  Wait Until Page Contains Element            ${edit.bid.button}
  Click Element                               ${edit.bid.button}
  ${fieldvalue}=   Convert to Number         ${fieldvalue}
  Sleep   5
  Execute Javascript                        $('input[id*="Value_Amount"]').data("kendoNumericTextBox").value(${fieldvalue});
  Sleep  5
  Click Element  xpath=//*[@type="submit"]

Завантажити документ в ставку
  [Arguments]   ${username}   ${path}   ${tender_uaid}   ${doc_type}=documents
  kapitalist.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait Until Page Contains Element            ${bids.tab}
  Click Element                               ${bids.tab}
  Sleep  5
  Wait Until Page Contains Element          xpath=//a[contains(@onclick, 'documents/_add')]
  Click Element     xpath=//a[contains(@onclick, '/documents/_add')]
  Sleep   3
  Wait Until Page Contains Element          id=Document
  Choose File       id=Document   ${path}
  Sleep   2
  Click Element     css=[type="submit"]
  Reload Page

Змінити документ в ставці
  [Arguments]   ${username}   ${tender_uaid}   ${path}   ${bidId}
  kapitalist.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait Until Page Contains Element            ${bids.tab}
  Click Element                               ${bids.tab}
  Sleep  5
  Wait Until Page Contains Element          xpath=//a[contains(@onclick, '/documents/') and contains(@onclick, '_edit')]
  Click Element     xpath=//a[contains(@onclick, '/documents/') and contains(@onclick, '_edit')]
  Sleep   3
  Wait Until Page Contains Element          id=Document
  Choose File       id=Document   ${path}
  Sleep   2
  Click Element     css=[type="submit"]
  Reload Page

Завантажити фінансову ліцензію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element   xpath=(//*[@id='btnShowBid' and not(contains(@style,'display: none'))])
  Click Element       id=btnShowBid
  Sleep   3
  Wait Until Page Contains Element    xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
  Click Element                id=btn_documents_add
  Select From List By Value    id=slFile_documentType      financialLicense
  Choose File                  xpath=(//*[@id='upload_form']/input[2])   ${filepath}
  Sleep   2
  Click Element     id=upload_button
  Reload Page

Отримати інформацію про bids
  [Arguments]  @{ARGUMENTS}
  Викликати для учасника  ${ARGUMENTS[0]}  Оновити сторінку з тендером  ${ARGUMENTS[1]}
  Click Element                       id=bids_ref

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  Switch Browser       ${ARGUMENTS[0]}
  Wait Until Page Contains Element   xpath=//*[@title="Перейти до аукціону"]
  Sleep   5
  ${result} =   get element attribute  xpath=//*[@title="Перейти до аукціону"]@href
  [return]   ${result}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  Switch Browser       ${ARGUMENTS[0]}
  Wait Until Page Contains Element   xpath=//a[contains(@href, 'auction-sandbox.openprocurement.org/tenders/')]
  Sleep   5
  ${result}=    Get Element Attribute  xpath=//a[contains(@href, 'auction-sandbox.openprocurement.org/tenders/')]@href
  [return]   ${result}
