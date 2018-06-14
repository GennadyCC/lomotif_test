Feature: User can LogIn to app

  Scenario Outline: I can LogIn if I provide valid Username and Password
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button
    Then I tap LogIn link
    Then I provide "<email>" and "<password>"
    And I tap LogIn button
    Then I can see "<username>" on top of the screen
#
    Examples:
    |email                |password   |username    |
    |r2xxxxd2+3@gmail.com |password.3 |r2xxxxd2.3  |