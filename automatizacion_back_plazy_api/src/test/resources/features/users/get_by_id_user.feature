Feature: Get user by id


  @GetUserById
  #Get User by ID
  Scenario: Get user by id success
    * def response = call read('classpath:features/users/post_user.feature')
    * def IdUser = response.IdUser
    * karate.log('User ID:', IdUser)

    Given url baseUrl
    And path 'users',IdUser
    When method GET
    Then status 200
    And match response.name contains 'QA'


  @GetUserByIdNotDoesntExist
  #Get User by id doesn't exist
  Scenario Outline: Get user by id  doesn't exist

    Given url baseUrl
    And path 'users', <id>
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | id     |
      | 100000 |