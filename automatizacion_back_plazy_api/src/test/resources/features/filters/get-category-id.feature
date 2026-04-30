Feature: Filters category id products

  Background:
    * url baseUrl

  @FilterFindByCategoryId
  Scenario Outline: Validate find product by cagtegory id '<id>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { categoryId: <id>}
    When  method GET
    Then status 200
    And match response == '#? _.length > 0'
    And match each response[*].category.id ==  <id>
    * match each response == productSchema


    Examples:
      | id |
      | 4  |

  @FilterFindByCategoryIdNotExist
  Scenario Outline: Validate find product by cagtegory id '<id>' not exist
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { categoryId: <id>}
    When  method GET
    Then status 200
    And match response == '#[]'



    Examples:
      | id  |
      | 100 |