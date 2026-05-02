Feature: Delete Product by Id

  Background:
    * url baseUrl

  @delete-product-by-id
  #Delete Product by ID
  Scenario: Delete product by id

    * def productCreate = call read('classpath:features/products/post.feature')
    * def idProduct = productCreate.IdProduct


    Given path 'products',idProduct
    When method DELETE
    Then status 200
    And match response == 'true'

    #Validate id user dont not exist
    Given path 'products', idProduct
    When method GET
    Then status 400
    And match response.message contains 'Could not find'