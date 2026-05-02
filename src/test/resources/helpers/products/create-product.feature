Feature: Generate Ramdom Product

  Scenario: Create Product

    * def title = java.util.UUID.randomUUID().toString().replace("-", "").substring(0, 8)
    * def price = (Math.floor(Math.random() * 10) + 1),
    * def product =
      """
      {
        "title": "Generic-#(title)",
        "price": "#(price)",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, #(title)  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "categoryId": 1,
        "images": [
            "https://placehold.co/600x400"
        ]
     }
      """