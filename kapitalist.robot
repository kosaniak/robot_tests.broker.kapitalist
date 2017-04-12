*** Settings ***
Library  Selenium2Screenshots
Library  Selenium2Library
Library  String
Library  DateTime
Library  kapitalist_service.py
Library  DebugLibrary

*** Variables ***
# Для тесткейсів
${locator.tenderId}                                             css=[class="body-wrapper"]>div>h3
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
${locator.items[0].description}                                 xpath=//*[@name="item.Description"]
${locator.items[0].deliveryDate.startDate}                      xpath=//*[@name="item.DeliveryDate"]/span[1]
${locator.items[0].deliveryDate.endDate}                        xpath=//*[@name="item.DeliveryDate"]/span[2]
${locator.items[0].additionalClassifications[0].description}    css=[name="item.AdditionalClassifications"]
${locator.items[0].additionalClassifications[0].id}    css=[name="item.AdditionalClassifications"]
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
${locator.questions[0].title}                                   css=[name="question.Title"]
${locator.questions[0].description}                             css=[name="question.Description"]
${locator.questions[0].date}                                    css=[name="question.Date"]
${locator.questions[0].answer}                                  css=[name="question.Answer"]
# ${locator.bids}
${locator.cancellations[0].status}                              css=[name="Status"]
${locator.cancellations[0].reason}                              css=[name="cancellation.Reason"]
${locator.document.title}                                       xpath=//*[@name="document.Title"]/a


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
${add.tender.document}           xpath=//*[@id="general"]/div/fieldset[1]/a[3]
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
${answerQuestionButton}          xpath=//*[contains(@href, 'addAnswer')]
${answer.text.field}             id=Answer
${answer.save.button}            css=[type="submit"]

#Подання пропозиції
${bid_take_part_button}              xpath=//*[@id="general"]//a[contains(text(), "Взяти участь")]
${bid_select_lot_checkbox}           xpath=//*[@class="cr"]
${bid_lot_value}                     id=Lots_c6a6d754-6ccc-48f4-b4f6-37a59c90f440__Value
${bid_add_document}                  id=files
${bid_approve_button}                xpath=//*[@type="submit"]
${bids.tab}                          xpath=//a[@href="#bids"]



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
  ${items_description}=   Get From Dictionary   ${items[0]}         description
  ${quantity}=          Get From Dictionary     ${items[0]}                        quantity
  ${cpv}=               Get From Dictionary     ${items[0].classification}         id
  # ${dkpp_id}=           Get From Dictionary     ${items[0].additionalClassifications}      id
  ${unit}=              Get From Dictionary     ${items[0].unit}                   name
  ${latitude}=          Get From Dictionary     ${items[0].deliveryLocation}      latitude
  ${longitude}=         Get From Dictionary     ${items[0].deliveryLocation}      longitude
  ${postalCode}=        Get From Dictionary     ${items[0].deliveryAddress}       postalCode
  ${streetAddress}=     Get From Dictionary     ${items[0].deliveryAddress}       streetAddress
  ${deliveryDate}=      Get From Dictionary     ${items[0].deliveryDate}          endDate
  ${deliveryDate}=      convert_date_to_format        ${deliveryDate}
  ${tenderPeriod}=   Get From Dictionary   ${tender_data.data}               tenderPeriod
  # ${enquiry_end_date}=   Get From Dictionary   ${tender_data.data.enquiryPeriod}         EndPeriod
  # ${enquiry_end_date}=   convert_date_to_format   ${enquiry_end_date}
  ${enquiry_end_date}=   get_all_dates   ${tender_data}         EndPeriod
  ${start_date}=         get_all_dates   ${tender_data}         StartDate
  ${end_date}=           get_all_dates   ${tender_data}         EndDate

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
  ...   Input Text   ${item.additional.classification}      1232123
  Execute Javascript                     $('#UnitId_chosen>a>span').trigger({type: 'mousedown', which: 1});
  # Click Element                         ${unitCode}
  # Sleep   2
  Input Text                            ${unitName}                       ${unit}
  # Click Element                         ${unit.active.result}
  Press Key                             ${unitName}                       \\\13
  Input Text                            ${unitQuantity}                   ${quantity}
  Input Text                            ${deliveryDateStartDateLocal}     ${deliveryDate}
  Input Text                            ${deliveryDateEndDateLocal}       ${deliveryDate}
  # Input Text                            ${deliveryAddressCountry}         Україна
  Input Text                            ${DeliveryAddress.Region}         Київська область
  # Press Key                             ${DeliveryAddress.Region}         \\\13
  Input Text                            ${DeliveryAddress.City}           м. Київ
  Input Text                            ${DeliveryAddress_PostalCode}     ${postalCode}
  Input Text                            ${DeliveryAddress_Street}         ${streetAddress}
  Click Element                         ${itemSaveButton}

  #Публікація тендеру
  Click Element                         ${publicTenderButton}
  Sleep  5
  wait until page contains element      xpath=//*[@id="tabstrip"]/../h3
  ${tender_UAid}=  Get Text  xpath=//*[@id="tabstrip"]/../h3
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
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  items
  ...      ${ARGUMENTS[1]} ==  ${INDEX}
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

#Виконано
Завантажити документ
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${filepath}
  ...      ${ARGUMENTS[2]} ==  ${TENDER}
  kapitalist.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[2]}
  Wait Until Page Contains Element             ${add.tender.document}        10
  Click Element                                ${add.tender.document}
  Input Text                                   ${tender.document.description}  Test_document
  Choose File                                  ${uploadButton}   ${ARGUMENTS[1]}
  Sleep             2
  Click Element                                ${tender.document.save.button}
  Reload Page

#Виконано
Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER}
  Switch Browser                    ${ARGUMENTS[0]}
  Go to                             ${USERS.users['${ARGUMENTS[0]}'].homepage}
  Wait Until Page Contains Element  ${tenderSearchButton}                           5
  Click Element                     ${tenderSearchButton}
  Wait Until Page Contains Element  ${byTenderNumber}                               5
  Click Element                     ${byTenderNumber}
  Wait Until Page Contains Element  ${PrecurementNumber}
  Input Text                        ${PrecurementNumber}                        ${ARGUMENTS[1]}
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
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tenderUaId
  ...      ${ARGUMENTS[2]} ==  questionId
  ${title}=        Get From Dictionary  ${questionId.data}  title
  ${description}=  Get From Dictionary  ${questionId.data}  description
  kapitalist.Перейти до сторінки запитань
  Sleep   3
  Input text          ${QuestionTitle}                 ${title}
  Input text          ${QuestionDescription}           ${description}
  Click Element       ${saveQuestionButton}
  Sleep  3

# виконане
Скасувати закупівлю
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = tenderUaId
  ...      ${ARGUMENTS[2]} = cancellation_reason
  ...      ${ARGUMENTS[3]} = doc_path
  ...      ${ARGUMENTS[4]} = description
  kapitalist.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}    ${ARGUMENTS[1]}
  Wait Until Page Contains Element   ${delete.tender.button}
  Click Element                      ${delete.tender.button}
  Sleep   2
  Input text                         ${tender.cancelation.reason}                 ${ARGUMENTS[2]}
  Input text                         ${description.cancelation.file}   ${ARGUMENTS[4]}
  Sleep  3
  Choose File                        ${cancelation.upload.file}   ${ARGUMENTS[3]}
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
  ${return_value}=   Get Text   xpath=//*[@name="Status"]
  [return]           ${return_value}

# Виконано
Отримати інформацію про description
  ${return_value}=   kapitalist.Отримати текст із поля і показати на сторінці   description
  [return]           ${return_value}

# Виконано
Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
  ${return_value}=   Convert to Number   ${return_value.split(' ')[0].replace(',', '.')}
  ${return_value}=   string_to_float   ${return_value}
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
  # ...   convert_date_to_format   ${field_value}
  ...   Should Be Equal   ${result_field}   convert_date_to_format   ${field_value}
  Should Be Equal   ${result_field}   convert_date_to_format   ${field_value}

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

Отримати інформацію про items[${index}].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].description
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[${index}].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.id
  [return]           ${return_value.split(' ')[0]}

# Додано селектор, але не перевірено
Отримати інформацію про items[${index}].classification.scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.scheme
  ${return_value}=   Remove String     ${return_value.split('(')[1]}     ):
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[${index}].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.description
  ${return_value}=   remove_first_word     ${return_value}
  # ${return_value}=   convert_string_to_common_string   ${return_value}
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
  ${return_value}=   convert_datetime_to_iso    ${return_value}
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про tenderPeriod.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  [return]           ${return_value}

# Виконано
Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   enquiryPeriod.startDate
  ${return_value}=   convert_datetime_to_iso    ${return_value}
  ${return_value}=   get_time_with_offset    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   enquiryPeriod.endDate
  # ${return_value}=   convert_date_to_format    ${date_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  ${return_value}=   convert_string_to_common_string   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.postalCode
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.region
  # ${return_value}=   convert_string_to_common_string   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.locality
  # ${return_value}=   convert_string_to_common_string   ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.streetAddress
  [return]           ${return_value}

# Внесені правки
Отримати інформацію про items[0].deliveryDate.startDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   items[0].deliveryDate.endDate
  # ${return_value}=   convert_date_to_format    ${return_value}
  [return]           ${return_value}

  # Внесені правки
Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=     Отримати текст із поля і показати на сторінці   items[0].deliveryDate.endDate
  # ${return_value}=   convert_date_to_format    ${return_value}
  [return]           ${return_value}

# Виконано
Отримати інформацію про questions[0].title
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].title
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

# Виконано
Відповісти на питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=     Get From Dictionary  ${ARGUMENTS[3].data}   answer
  kapitalist.Пошук тендера по ідентифікатору        ${ARGUMENTS[0]}          ${ARGUMENTS[1]}
  Reload Page
  Sleep   1
  Wait Until Page Contains Element      ${answerQuestionButton}
  Click Element                         ${answerQuestionButton}
  Input Text                            ${answer.text.field}                 ${answer}
  Click Element                         ${answer.save.button}
  sleep   1

#Done
Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field_name}
  ${return_value}=  Отримати текст із поля і показати на сторінці   document.${field_name}
  [return]   ${return_value}

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element   xpath=//*[@name='document.Title']/a[contains(text(), '${doc_id}')]
  sleep   3
  ${file_name}=   Get Text    xpath=//*[@name='document.Title']/a[contains(text(), '${doc_id}')]
  ${url}=   Get Element Attribute    xpath=//*[@name='document.Title']/a[contains(text(), '${doc_id}')]@href
  download_document_from_url   ${url}    ${OUTPUT_DIR}
  [return]  ${file_name}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Перейти до сторінки запитань
  ${return_value}=      Run Keyword If   '${field_name}' == 'title'
  ...     Get Text    xpath=(//*[@name="") and contains(@class, '${item_id}')])
  ...     ELSE IF  '${field_name}' == 'answer'     Get Text    xpath=(//span[contains(@class, 'qa_answer') and contains(@class, '${item_id}')])
  ...     ELSE    Get Text   xpath=(//span[contains(@class, 'qa_description') and contains(@class, '${item_id}')])
  [return]           ${return_value}

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Задати питання   ${username}    ${tender_uaid}     ${question}


# Виконано
Відповісти на запитання
  [Arguments]    ${username}   ${tender_uaid}    ${answer_data}   ${item_id}
  kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Перейти до сторінки запитань
  Wait Until Page Contains Element      ${answerQuestionButton}
  Click Element                         ${answerQuestionButton}
  Input Text                            id=e_answer                             ${answer_data.data.answer}
  Click Element                         id=SendAnswer
  sleep   1

Подати цінову пропозицію
  [Arguments]   ${username}    ${tender_id}   ${test_bid_data}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  ...    ${ARGUMENTS[2]} ==  ${test_bid_data}
  ${amount}=    Get From Dictionary     ${test_bid_data.data.value}         amount
  # kapitalist.Пошук тендера по ідентифікатору    ${username}  ${tender_id}
  Wait Until Page Contains Element          ${bid_take_part_button}
  Click Element                             ${bid_take_part_button}
  Sleep   3
  Select Window   id=form0
  Wait Until Page Contains Element          ${bid_select_lot_checkbox}
  Click Element                             ${bid_select_lot_checkbox}
  Execute Javascript                        $(${bid_lot_value}).data("kendoNumericTextBox").value(${amount});
  # Run Keyword If    ${is_qualified}   Click Element   id=lcbBid_selfQualified
  # Run Keyword If    ${is_eligible}    Click Element   id=lcbBid_selfEligible
  Click Element                             ${bid_approve_button}
  sleep   3
  # Wait Until Page Contains Element          ${bids.tab}     10
  # Click Element                             ${bids.tab}
  # sleep   1
  # ${resp}=    Get Value      id=eBid_price
  # [return]    ${resp}

Скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  kapitalist.Пошук тендера по ідентифікатору  ${ARGUMENTS[0]}  ${ARGUMENTS[1]}
  Wait Until Page Contains Element   ${bids.tab}
  Click Element       ${bids.tab}
  Sleep   3
  Wait Until Page Contains Element   xpath=(//*[@id='btn_delete' and not(contains(@style,'display: none'))])
  Click Element       id=btn_delete

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element            ${bids.tab}
  Click Element                               ${bids.tab}
  Sleep   3
  ${value}=   Get Value     id=eBid_price
  ${value}=   Convert To Number      ${value}
  [Return]    ${value}

Змінити цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  ...    ${ARGUMENTS[2]} ==  amount
  ...    ${ARGUMENTS[3]} ==  amount.value
  ${amount}=    get_str          ${${ARGUMENTS[3]}}
  kapitalist.Пошук тендера по ідентифікатору  ${ARGUMENTS[0]}  ${ARGUMENTS[1]}
  Wait Until Page Contains Element          xpath=(//*[@id='btnShowBid' and not(contains(@style,'display: none'))])
  Click Element       id=btnShowBid
  Sleep   3
  Wait Until Page Contains Element          xpath=(//*[@id='eBid_price' and not(contains(@style,'display: none'))])
  Input Text              id=eBid_price     ${amount}
  sleep   1
  Click Element       id=btn_public

Завантажити документ в ставку
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  tenderId
  Wait Until Page Contains Element          xpath=(//*[@id='btnShowBid' and not(contains(@style,'display: none'))])
  Click Element     id=btnShowBid
  Sleep   3
  Wait Until Page Contains Element          xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
  Click Element     id=btn_documents_add
  Choose File       xpath=(//*[@id='upload_form']/input[2])   ${ARGUMENTS[1]}
  Sleep   2
  Click Element     id=upload_button
  Reload Page

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  bidId
  Reload Page
  Wait Until Page Contains Element           xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
  Click Element     css=.bt_ReUpload:first-child
  Choose File       xpath=(//*[@id='upload_form']/input[2])   ${ARGUMENTS[1]}
  Sleep   2
  Click Element     id=upload_button
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
  Wait Until Page Contains Element   xpath=(//*[@id='aPosition_auctionUrl' and not(contains(@style,'display: none'))])
  Sleep   5
  ${result} =   Get Text  id=aPosition_auctionUrl
  [return]   ${result}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  Switch Browser       ${ARGUMENTS[0]}
  Wait Until Page Contains Element   xpath=(//*[@id='aPosition_auctionUrl' and not(contains(@style,'display: none'))])
  Sleep   5
  ${result}=    Get Text  id=aPosition_auctionUrl
  [return]   ${result}



# Завантажити документ в тендер з типом
#   [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${doc_type}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   Wait Until Page Contains Element       xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                          id=btn_documents_add
#   Select From List By Value              id=slFile_documentType      ${doc_type}
#   Choose File                            xpath=(//*[@id='upload_form']/input[2])   ${filepath}
#   Sleep   2
#   Click Element     id=upload_button

# Завантажити ілюстрацію
#   [Arguments]  ${username}  ${tender_uaid}  ${filepath}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   Wait Until Page Contains Element       xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                          id=btn_documents_add
#   Select From List By Value              id=slFile_documentType      illustration
#   Choose File                            xpath=(//*[@id='upload_form']/input[2])   ${filepath}
#   Sleep   2
#   Click Element     id=upload_button

# Додати Virtual Data Room
#   [Arguments]  ${username}  ${tender_uaid}  ${vdr_url}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   Wait Until Page Contains Element       xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                          id=btn_documents_add
#   Select From List By Value              id=slFile_documentType      virtualDataRoom
#   Input text                             id=eFile_url                ${vdr_url}
#   Click Element     id=upload_button

# Додати публічний паспорт активу
#   [Arguments]  ${username}  ${tender_uaid}  ${vdr_url}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   Wait Until Page Contains Element       xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                          id=btn_documents_add
#   Select From List By Value              id=slFile_documentType      x_dgfPublicAssetCertificate
#   Input text                             id=eFile_url                ${vdr_url}
#   Click Element     id=upload_button

# Додати офлайн документ
#   [Arguments]  ${username}  ${tender_uaid}  ${accessDetails}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   Wait Until Page Contains Element       xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                          id=btn_documents_add
#   Select From List By Value              id=slFile_documentType      x_dgfAssetFamiliarization
#   Input text                             id=eFile_accessDetails      ${accessDetails}
#   Click Element     id=upload_button

# Отримати інформацію із документа по індексу
#   [Arguments]  ${username}  ${tender_uaid}  ${document_index}  ${field}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   ${doc_value}=  Get Text   xpath=(//*[@id='pn_documentsContent_']/table[${document_index + 1}]//span[contains(@class, 'documentType')])
#   [return]  ${doc_value}



# Отримати кількість предметів в тендері
#   [Arguments]  ${username}  ${tender_uaid}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   ${return_value}=    Get Text           id=tPosition_items_count
#   ${return_value}=    Convert To Number  ${return_value}
#   [return]            ${return_value}



# Задати запитання на предмет
#   [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element      xpath=(//*[@id='tPosition_status' and not(contains(@style,'display: none'))])
#   Click Element     xpath=(//span[contains(@class, 'bt_item_question') and contains(@class, '${item_id}')])
#   Sleep  3
#   Input text          id=e_title                 ${question.data.title}
#   Input text          id=e_description           ${question.data.description}
#   Click Element     id=SendQuestion
#   Sleep  3

# Додати предмет закупівлі
#   [Arguments]  ${username}  ${tender_uaid}  ${item}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   ${index}=  kapitalist.Отримати кількість предметів в тендері     ${username}   ${tender_uaid}
#   ${ItemAddButtonVisible}=    Page Should Contain Element    id=btn_items_add
#   Run Keyword If  '${ItemAddButtonVisible}'=='PASS'   Run Keywords
#   ...   Додати предмет                ${item}                ${index}
#   ...   AND    Click Element                 id=btnPublic
#   ...   AND    Wait Until Page Contains      Публікацію виконано    10

# Видалити предмет закупівлі
#   [Arguments]  ${username}  ${tender_uaid}  ${item_id}
#   kapitalist.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
#   ${ItemAddButtonVisible}=    Page Should Contain Element    id=btn_items_add
#   Run Keyword If  '${ItemAddButtonVisible}'=='PASS'   Run Keywords
#   ...   Wait Until Page Contains Element   xpath=(//ul[contains(@class, 'bt_item_delete') and contains(@class, ${item_id})])
#   ...   AND    Click Element     xpath=(//ul[contains(@class, 'bt_item_delete') and contains(@class, ${item_id})])
#   ...   AND    Click Element      id=btnPublic
#   ...   AND    Wait Until Page Contains      Публікацію виконано         10

# Отримати кількість документів в тендері
#   [Arguments]  ${username}  ${tender_uaid}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   ${tender_doc_number}=   Get Matching Xpath Count   xpath=(//*[@id='pn_documentsContent_']/table)
#   [Return]  ${tender_doc_number}


# Отримати дані із документу пропозиції
#   [Arguments]  ${username}  ${tender_uaid}  ${bid_index}  ${document_index}  ${field}
#   ${document_index}=        inc         ${document_index}
#   ${result}=   Get Text                 xpath=(//*[@id='pnAwardList']/div[last()]/div/div[1]/div/div/div[2]/table[${document_index}]//span[contains(@class, 'documentType')])
#   [Return]   ${result}

# Отримати кількість документів в ставці
#   [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   ${bid_doc_number}=   Get Matching Xpath Count   xpath=(//*[@id='pnAwardList']/div[last()]/div/div[1]/div/div/div[2]/table)
#   [Return]  ${bid_doc_number}

# Скасування рішення кваліфікаційної комісії
#   [Arguments]  ${username}  ${tender_uaid}  ${award_num}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element      xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'Cancel_button')])
#   Sleep   1
#   Click Element                         xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'Cancel_button')])

# Підтвердити постачальника
#   [Arguments]  ${username}  ${tender_uaid}  ${award_num}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element      xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'award_button')])
#   Sleep   1
#   Click Element                         xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'award_button')])

# Дискваліфікувати постачальника
#   [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
#   Input text          xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'Reject_description')])                 ${description}
#   Click Element       xpath=(//*[@id='pnAwardList']/div[last()]//*[contains(@class, 'Reject_button')])

# Завантажити документ рішення кваліфікаційної комісії
#   [Arguments]  ${username}  ${filepath}  ${tender_uaid}  ${award_num}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element      xpath=(//*[@id='tPosition_status' and not(contains(@style,'display: none'))])
#   Click Element                xpath=(//*[@id='pnAwardList']/div[last()]//div[contains(@class, 'award_docs')]//span[contains(@class, 'add_document')])
#   Choose File                  xpath=(//*[@id='upload_form']/input[2])   ${filepath}
#   Sleep   2
#   Click Element     id=upload_button
#   Reload Page

# Завантажити протокол аукціону
#   [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${award_index}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element          xpath=(//*[@id='btnShowBid' and not(contains(@style,'display: none'))])
#   Click Element       id=btnShowBid
#   Sleep   1
#   Wait Until Page Contains Element          xpath=(//*[@id='btn_documents_add' and not(contains(@style,'display: none'))])
#   Click Element                             id=btn_documents_add
#   Select From List By Value    id=slFile_documentType      auctionProtocol
#   Choose File                  xpath=(//*[@id='upload_form']/input[2])   ${filepath}
#   Sleep   2
#   Click Element     id=upload_button

# Завантажити угоду до тендера
#   [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${filepath}
#   kapitalist.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#   Wait Until Page Contains Element      xpath=(//*[@id='tPosition_status' and not(contains(@style,'display: none'))])
#   Click Element                xpath=(//*[@id='pnAwardList']/div[last()]//div[contains(@class, 'contract_docs')]//span[contains(@class, 'add_document')])
#   Select From List By Value    id=slFile_documentType      contractSigned
#   Choose File                  xpath=(//*[@id='upload_form']/input[2])   ${filepath}
#   Sleep   2
#   Click Element     id=upload_button
#   Reload Page

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  ${file_path}  ${file_title}  ${file_content}=   create_fake_doc
  Sleep    5
  kapitalist.Завантажити угоду до тендера   ${username}  ${tender_uaid}  1  ${filepath}
  Wait Until Page Contains Element      xpath=(//*[@id='tPosition_status' and not(contains(@style,'display: none'))])
  Click Element                xpath=(//*[@id='pnAwardList']/div[last()]//span[contains(@class, 'contract_register')])


