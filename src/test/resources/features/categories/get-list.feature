Feature: Get list categories

  Background:
    * url baseUrl

        #Get List All categories
  @get-all-categories
  Scenario: Get list categories
    * def categorieSchema =  read('classpath:schemas/categories/categories-schema.json')

    Given path 'categories'
    When method GET
    Then status 200
    And match each response == categorieSchema

  #Get List All Categories By Slug
  @get-categories-by-slug
  Scenario: Get list by slug categories
    * def categorieSchema =  read('classpath:schemas/categories/categories-schema.json')

    * def response = call read('classpath:features/categories/post.feature')
    * def IdCategorie = response.IdCategorie
    * def categorieSlug = response.CategorieSlug

    Given path 'categories/slug',categorieSlug
    When method GET
    Then status 200
    And match response == categorieSchema
    And match response.slug == categorieSlug


