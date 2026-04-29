Feature: Delete user by Id

  @DeleteUserById
  #Delete User by ID
  Scenario: Delete user by id
    * def response = call read('classpath:features/users/post_user.feature')
    * def IdUser = response.IdUser
    * karate.log('User ID:', IdUser)

    Given url baseUrl
    And path 'users',IdUser
    When method DELETE
    Then status 200
    And match response == 'true'

  @DeleterUserByIdNotDoesntExist
  #Delete User by id doesn't exist
  Scenario Outline: Delete user by id  doesn't exist

    Given url baseUrl
    And path 'users', <id>
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | id     |
      | 100000 |
