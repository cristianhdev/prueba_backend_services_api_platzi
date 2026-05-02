
Feature: Validate error services

  Background:
    * url baseUrl

  @404-page-not-found
  Scenario: Products url not validate

    Given path 'user'
    When method GET
    Then status 404


  @header-content-post
  Scenario: Category  'Content-Type' validate

    * def categorieData = call read('classpath:helpers/categories/create-categorie.feature')
    * def categorieSchema = read('classpath:schemas/categories/categories-schema.json')

    Given path 'categories'
    And header Content-Type = 'application/xml'
    And request categorieData.categorie
    When method POST
    Then status 500