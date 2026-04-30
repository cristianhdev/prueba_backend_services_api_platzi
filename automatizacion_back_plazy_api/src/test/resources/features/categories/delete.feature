Feature: Delete Categorie by Id

  Background:
    * url baseUrl

  @DeleteCategorieById
  #Delete Categorie by ID
  Scenario: Delete categorie by id
    * def response = call read('classpath:features/categories/post.feature')
    * def IdCategorie = response.IdCategorie

    Given path 'categories',IdCategorie
    When method DELETE
    Then status 200
    And match response == 'true'

    * karate.log("Response", IdCategorie)

    # Validate id categorie dont not exist in list
    And path 'categories',IdCategorie
    When method GET
    Then status 400
     #* def ids = response[*].id
    #And match ids !contains IdCategorie
    And match response.message contains 'Could not find'
