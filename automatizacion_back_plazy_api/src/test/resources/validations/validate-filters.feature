Feature: Product filter validator

  Scenario:
    * def min = 0
    * def max = 100
    * karate.log("Response", min)
    * karate.log("Response", max)

    """
    {
      "id": "#number",
      "title": "#string",
      "slug": "#string",
      "price": "#? _ > min && _ < max",
      "description": "#string",
      "category": {
        "id": "#number",
        "name": "#string",
        "slug": "#string",
        "image": "#string",
        "creationAt": "#string",
        "updatedAt": "#string"
      },
      "images": "#[] #string",
      "creationAt": "#string",
      "updatedAt": "#string"
    }
    """