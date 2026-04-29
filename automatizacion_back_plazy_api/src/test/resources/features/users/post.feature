Feature: Create user

  @CreateNewUser
  #Create User
  Scenario: Create user success
    * url baseUrl
    * def userData =  read('classpath:data/users/user-data.json')
    * def userSchema =  read('classpath:schemas/users/user-schema.json')


    Given path 'users'
    And request userData
    When method POST
    Then status 201
    And match response ==  userSchema
    And match response.name contains 'QA'

    * def IdUser = response.id
    * karate.log("Response", response)


