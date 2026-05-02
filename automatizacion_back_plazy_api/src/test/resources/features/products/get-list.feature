Feature: Get list products

        #Get List All products
  @getallproducts
  Scenario: Get list products
    * def productsSchema =  read('classpath:schemas/products/products-schema.json')
    Given url baseUrl
    And path 'products'
    When method GET
    Then status 200
    And match each response == productsSchema