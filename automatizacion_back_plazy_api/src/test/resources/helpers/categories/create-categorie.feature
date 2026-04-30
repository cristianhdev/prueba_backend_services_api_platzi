Feature: Generate Ramdom Categorie

  Scenario: Create Categorie

    * def id = java.util.UUID.randomUUID()
    * def categorie =
    """
    {
      "name": "Product-#(id)",
      "image": "https://placehold.co/600x400"
    }
    """