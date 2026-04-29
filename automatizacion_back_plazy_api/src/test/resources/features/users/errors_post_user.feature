@ValidateInputsPost
Feature: Validate post user


  @EmailInputValidate
  Scenario Outline: Validate that the email field when creating a user account
    * def userData =  read('classpath:data/users/user-data.json')

    Given url baseUrl
    And path 'users'
    *  userData.email = '<email>'
    When request userData
    When method POST
    And status 400
    And match response.message contains '<message>'
    Examples:
      | email          | message                   |
      | testcorreo.com | email must be an email    |
      |                | email should not be empty |


  @PasswordInputValid
  Scenario Outline: Validate the password field when creating a user account
    * def userData =  read('classpath:data/users/user-data.json')

    Given url baseUrl
    And path 'users'
    *  userData.password = '<password>'
    When request userData
    When method POST
    And status 400
    And match response.message contains '<message>'
    Examples:
      | password           | message                                               |
      | 123                | password must be longer than or equal to 4 characters |
      |                    | password should not be empty                          |
      | !"#$%&/(?=¡¿)_[¨*] | password must contain only letters and numbers        |