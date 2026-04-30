@ValidateUserErrors
Feature: Validate user


  Background:
    * url baseUrl

  @EmailInputValidate
  Scenario Outline: Validate that the  <message>  when creating a user account
    * def userData =  read('classpath:data/users/user-data.json')

    Given path 'users'
    *  userData.email = '<email>'
    When request userData
    When method POST
    And status 400
    And match response.message contains '<message>'
    Examples:
      | read('classpath:data/users/error-email-data.json') |


  @PasswordInputValid
  Scenario Outline: Validate the <message> when creating a user account
    * def userData =  read('classpath:data/users/user-data.json')

    Given path 'users'
    *  userData.password = '<password>'
    When request userData
    When method POST
    And status 400
    And match response.message contains '<message>'
    Examples:
      | read('classpath:data/users/error-password-data.json') |  |

  @DeleterUserByIdNotDoesntExist
  #Delete User by id doesn't exist
  Scenario Outline: Delete user by id  doesn't exist

    Given path 'users', <id>
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | id     |
      | 100000 |