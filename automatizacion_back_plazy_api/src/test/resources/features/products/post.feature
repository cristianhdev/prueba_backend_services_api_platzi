Feature: Create product

  @create-new-product
  #Create Product
  Scenario: Create product success
    * url baseUrl
    * def productData =  call read('classpath:helpers/products/create-product.feature')
    * def productSchema =  read('classpath:schemas/products/products-schema.json')


    Given path 'products'
    And request productData.product
    When method POST
    Then status 201
    And match response ==  productSchema
    And match response.title contains productData.title

    * def IdProduct = response.id
