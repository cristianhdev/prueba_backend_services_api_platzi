Feature: Filters price products

  Background:
    * url baseUrl


  @FilterFindByPrice
  Scenario Outline: Validate find product by price '<price>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { price: <price>}
    When  method GET
    Then status 200
    And match response == '#[]'
    And match each response[*].price ==  <price>
    * match each response == productSchema


    Examples:
      | price |
      | 73    |

  @FilterFindByPriceNotProductExist
  Scenario Outline: Validate find product by price '<price>', product not exist
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { price: <price>}
    When  method GET
    Then status 200
    And match response == '#[]'



    Examples:
      | price |
      | 10000 |