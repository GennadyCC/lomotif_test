Feature: I can create 15s Lomotif video photo taken from phone

  Scenario Outline: I can create Lomotif
    Given I open Add Photo & Video screen
    Then I find "<folder_name>" folder
    And I select first "<files_num>" files
    Then I go to the add sound screen
    When I find music "<music>"
    Then I select first song
    And I go to the next screen
    Then I establish duration 15s
    When I tap Export icon
    Then I confirm that I want to export my project
    Then I tap to Show me my Lomotif button
    And I select the last Lomotif project

    Examples:
    |folder_name  |files_num  |music    |
    |Camera       |2          |Rock     |
    |Camera       |3          |Disco    |
