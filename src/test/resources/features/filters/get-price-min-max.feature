Feature: Filters By Price Range Products

  Background:
    * url baseUrl



  @filter-find-by-price-range-top
  Scenario Outline: Validate find product by price range min '<price_min>' and max '<price_mmax>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { price_min: <price_min>,price_max:<price_max>}
    When  method GET
    Then status 200
    * def filtered = response.filter(x => x.price >= price_min && x.price <= price_max)
    * karate.log("Response", filtered)
    * match filtered == '#[]'

    #este escenario retorna un falso positivo, porque solo tiene en cuenta el precio minimo no el price mayor
    Examples:
      | price_min | price_max |
      | 99999     | 0         |

  @filter-find-by-price-range-border-negative
  Scenario Outline: Validate find product by price range min '<price_min>' and max '<price_max>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { price_min: <price_min>,price_max:<price_max>}
    When  method GET
    Then status 400

    #este escenario retorna un falso positivo, porque solo tiene en cuenta el precio minimo no el price mayor
    Examples:
      | price_min | price_max |
      | -10       | -999      |
      | 10        | -999      |
      | 9999      | -1        |


  @filter-find-by-price-range-border
  Scenario Outline: Validate find product by price range max '<price_min>' and min '<price_max>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')



    Given path 'products'
    And params { price_min: <price_min>,price_max:<price_max>}
    When  method GET
    Then status 200
    And match response == '#[]'
    # Validate range price valid
    * def filtered = response.filter(x => x.price >= price_min && x.price <= price_max)
    * match each response == productSchema

    Examples:
      | price_min | price_max |
      | 0         | 10        |
      | 71        | 89        |
      | 73        | 90        |
      | 72        | 91        |

  @filter-find-by-price-range-cross
  Scenario Outline: Validate find product by price range max '<price_min>' and min '<price_max>'
    * def productSchema =  read('classpath:schemas/products/products-schema.json')



    Given path 'products'
    And params { price_min: <price_min>,price_max:<price_max>}
    When  method GET
    Then status 200
    # Validate range price valid
    * def filtered = response.filter(x => x.price >= price_min && x.price <= price_max)
    And match filtered == '#[]'
    And match filtered.length == 0

    Examples:
      | price_min     | price_max      |
      | 9999999999999 | 10000000000000 |