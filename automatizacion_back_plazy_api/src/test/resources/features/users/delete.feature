Feature: Delete user by Id

  Background:
    * url baseUrl

  @delete-user-by-id
  #Delete User by ID
  Scenario: Delete user by id
    * def response = call read('classpath:features/users/post.feature')
    * def IdUser = response.IdUser

    Given path 'users',IdUser
    When method DELETE
    Then status 200
    And match response == 'true'

    #Validate id user dont not exist
    Given path 'users', IdUser
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
