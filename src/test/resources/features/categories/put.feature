Feature: Update categorie by id

  @update-categorie
  #Update Categorie
  Scenario: Update categorie success
    * url baseUrl
    * def categorieData = call read('classpath:helpers/categories/create-categorie.feature')
    * def response = call read('classpath:features/categories/post.feature')
    * def IdCategorie = response.IdCategorie

    * def categorieSchema =  read('classpath:schemas/categories/categories-schema.json')

    Given path 'categories',IdCategorie

    And request categorieData.categorie
    When method PUT
    Then status 200
    And match response == categorieSchema
    And match response.name contains categorieData.categorie.name