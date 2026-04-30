Feature: Generate Ramdom User

  Scenario: Create User

    * def id = java.util.UUID.randomUUID().toString().replace("-", "").substring(0, 8)
    * def email = (Math.floor(Math.random() * 100) + 1),
    * def user =
      """
      {
        "name": "QA-#(id)",
        "email": "test_#(email)@com.es",
        "password": "12312312",
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      }
      """