Feature: Delete Product by Id

  Background:
    * url baseUrl

  @delete-product-by-id
  #Delete Product by ID
  Scenario: Delete product by id

    Given path 'users',84
    When method DELETE
    Then status 400
    And match response == 'true'

    #Validate id user dont not exist
    Given path 'users', 84
    When method GET
    Then status 400
    And match response.message contains 'Could not find'