Feature: Filters By Title Products

    Background:
      * url baseUrl

 @filter-find-by-title
  Scenario Outline: Validate find product by title '<title>'
   * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { title: '<title>'}
    When  method GET
    Then status 200
    And match response == '#[]'
    And match each response == productSchema
    And match each response constains { title: '#? _ = '<title>''}

   Examples:
     | read('classpath:data/filters/filter-title-data.json') |  |


  @filter-find-by-title-not-exist
  Scenario Outline: Validate find product by title '<title>' not exist
    * def productSchema =  read('classpath:schemas/products/products-schema.json')

    Given path 'products'
    And params { title: '<title>'}
    When  method GET
    Then status 200
    And match response == '#[]'

    Examples:
      | title    |  |
      | chaqueta |  |