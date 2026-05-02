Feature: Update user by id

  @updateuser
  #Update User
  Scenario: Update User success
    * url baseUrl
    * def userUpdateData =  read('classpath:data/users/user-update-data.json')
    * def response = call read('classpath:features/users/post.feature')
    * def IdUser = response.IdUser
    * karate.log("Response", IdUser)
    * def userSchema =  read('classpath:schemas/users/user-schema.json')

    Given path 'users',IdUser

    And request userUpdateData


    When method PUT
    Then status 200
    And match response ==  userSchema
    And match response contains userUpdateData