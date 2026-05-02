Feature: Get user by id


  Background:
    * url baseUrl

  @get-user-by-id
  #Get User by ID
  Scenario: Get user by id success
    * def responseUser = call read('classpath:features/users/post.feature')
    * def IdUser = responseUser.IdUser

    Given path 'users',IdUser
    When method GET
    Then status 200
    And match response.name contains 'QA'

