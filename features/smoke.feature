Feature: I can create 15s Lomotif video photo taken from phone

  @smoke1
  Scenario Outline: I can create Lomotif
    Given I open Add Photo & Video screen
    Then I find "<folder_name>" folder
    And I select first "<files_num>" files
    Then I go to the add sound screen
    When I find music "<music>"
    Then I select first song
    And I go to the next screen
    Then I establish duration "<sec>" sec. from max. 30s to min. 3s
    When I tap Export icon
    Then I confirm that I want to export my project
    Then I tap to Show me my Lomotif button
    And I select the last Lomotif project
    Then I close application


    Examples:
    |folder_name  |files_num  |music    |sec  |
    |Camera       |3          |Rock     |3    |
    |Camera       |1          |Disco    |20   |
