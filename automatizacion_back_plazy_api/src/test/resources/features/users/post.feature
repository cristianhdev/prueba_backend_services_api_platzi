Feature: Create user

  @createnewuser
  #Create User
  Scenario: Create user success
    * url baseUrl
    * def userData =  call read('classpath:helpers/user/create-user.feature')
    * karate.log("Response", userData)
    * def userSchema =  read('classpath:schemas/users/user-schema.json')


    Given path 'users'
    And request userData.user
    When method POST
    Then status 201
    And match response ==  userSchema
    And match response.name contains 'QA'

    * def IdUser = response.id


