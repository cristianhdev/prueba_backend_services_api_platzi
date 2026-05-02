Feature: Create categorie

  @create-new-categories
  Scenario: Create categorie success
    * url baseUrl
    * def categorieData = call read('classpath:helpers/categories/create-categorie.feature')
    * def categorieSchema = read('classpath:schemas/categories/categories-schema.json')

    Given path 'categories'
    And request categorieData.categorie
    When method POST
    Then status 201
    And match response ==  categorieSchema
    And match response.name contains categorieData.categorie.name
    And match response.slug contains categorieData.categorie.name.toLowerCase()

    * def IdCategorie = response.id
    * def CategorieName = response.name


