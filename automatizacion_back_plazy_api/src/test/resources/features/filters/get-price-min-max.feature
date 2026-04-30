Feature: Filters price range products

  Background:
    * url baseUrl



  @FilterFindByPriceRangeBorder
  Scenario Outline: Validate find product by price range min '<price_max>' and max '<price_min>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { price_min: <price_max>,price_max:<price_min>}
    When  method GET
    Then status 200
    And match response == '#[]'
    * def filtered = response.filter(x => x.price >= price_min && x.price <= price_max)
    * assert filtered.length > 0
    * match each response == productSchema



    Examples:
      | read('classpath:data/filters/filter-price-border-data.json') |  |

  @FilterFindByPriceRange
  Scenario Outline: Validate find product by price range max '<price_max>' and min '<price_min>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')



    Given path 'products'
    And params { price_min: <price_min>,price_max:<price_max>}
    When  method GET
    Then status 200
    And match response == '#[]'
    # Validate range price valid
    * def filtered = response.filter(x => x.price >= price_min && x.price <= price_max)
    # if filtered is diferent 0, response item valid
    * assert filtered.length > 0
    * match each response == productSchema

    Examples:
      | read('classpath:data/filters/filter-price-min-max-data.json') |  |



