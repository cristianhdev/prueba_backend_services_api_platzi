Feature: Update user by id

  @UpdateUser
  #Update User
  Scenario: Update User success
    * url baseUrl
    * def response = call read('classpath:features/users/post.feature')
    * def IdUser = response.IdUser

    * def userSchema =  read('classpath:schemas/users/user-schema.json')

    Given path 'users',IdUser

    And request
      """
      {
	      "name": "testQA2025"
      }
      """

    When method PUT
    Then status 200
    And match response ==  userSchema
    And match response.name contains 'testQA2025'