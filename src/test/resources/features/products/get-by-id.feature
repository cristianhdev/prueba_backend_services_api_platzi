Feature: Get product by id


  Background:
    * url baseUrl

  @get-product-by-id
  #Get Product by ID
  Scenario: Get product by id success

    * def productCreate = call read('classpath:features/products/post.feature')
    * def idProduct = productCreate.IdProduct
    * def title = productCreate.TitleProduct

    Given path 'products',idProduct
    When method GET
    Then status 200
    And match response.title contains title


