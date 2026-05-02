Feature: Get product by id


  Background:
    * url baseUrl

  @get-product-by-id
  #Get Product by ID
  Scenario: Get product by id success

    Given path 'products',50
    When method GET
    Then status 200
    And match response.title contains 'iPhone 90.43450444310218705'

