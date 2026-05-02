Feature: Get list users

        #Get List All User
  @getallusers
  Scenario: Get list users
    * def userSchema =  read('classpath:schemas/users/user-schema.json')
    Given url baseUrl
    And path 'users'
    When method GET
    Then status 200
    And match each response == userSchema
