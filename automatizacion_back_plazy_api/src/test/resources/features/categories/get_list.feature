Feature: Get list categories

        #Get List All categories
  @GetAllCategories
  Scenario: Get list categories
    * def categorieSchema =  read('classpath:schemas/categories/categories-schema.json')
    Given url baseUrl
    And path 'categories'
    When method GET
    Then status 200
    And match each response == categorieSchema

  #Get List All Categories By Slug
  @GetCategoriesBySlug
  Scenario Outline: Get list by slug categories
    * def categorieSchema =  read('classpath:schemas/categories/categories-schema.json')
    Given url baseUrl
    And path 'categories/slug','<slug>'
    When method GET
    Then status 200
    And match response == categorieSchema
    And match response.slug == '<slug>'
    Examples:
      | slug        |
      | electronics |

