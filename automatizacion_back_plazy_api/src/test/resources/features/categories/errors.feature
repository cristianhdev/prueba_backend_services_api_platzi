@ValidateCaterogiresErrors
Feature: Validate categories

  Background:
    * url baseUrl

  @getcategoriebyslugnotdoesntexist
  #Get Categorie by Slug doesn't exist
  Scenario Outline: Get categorie by slug  doesn't exist


    Given path 'categories/slug', '<slug>'
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | slug |
      | TV   |

  @getcategoriebyidnotdoesntexist
  #Get Categorie by id doesn't exist
  Scenario Outline: Get categorie by id  doesn't exist

    Given path 'categories', <id>
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | id   |
      | 1099 |

  @deletecategoriebyidnotdoesntexist
  #Delete Categorie by id doesn't exist
  Scenario Outline: Delete categorie by id  doesn't exist

    Given path 'categories', <id>
    When method GET
    Then status 400
    And match response.message contains 'Could not find'
    Examples:
      | id     |
      | 100000 |