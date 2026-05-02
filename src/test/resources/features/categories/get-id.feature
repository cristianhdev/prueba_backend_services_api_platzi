Feature: Get categories by id

  Background:
    * url baseUrl

  @get-categorie-by-id
  #Get Categorie by ID
  Scenario: Get categorie by id success
    * def response = call read('classpath:features/categories/post.feature')
    * def IdCategorie = response.IdCategorie
    * def CategorieName = response.CategorieName


    Given path 'categories',IdCategorie
    When method GET
    Then status 200
    And match response.id == IdCategorie
    And match response.name contains CategorieName

