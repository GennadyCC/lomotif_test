Feature: User can LogIn to app

  @login
  Scenario Outline: I can LogIn if I provide valid Username and Password
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button
    Then I tap LogIn link
    Then I provide "<email>" and "<password>"
    And I tap LogIn button
    Then I can see "<username>" on top of the screen
    And I close application

    Examples:
    |email                |password   |username    |
    |r2xxxxd2+3@gmail.com |password.3 |r2xxxxd2.3  |

  @signup
  Scenario Outline: I can Sign up if I provide valid data
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button
    And I tap Sign up link
    Then I I provide "<email>", "<password>" and "<username>"
    And I tap the Sign up button
    Then I can see "<username>" on top of the screen

  Examples:
  |email                |password   |username    |
  |r2xxxxd2+4@gmail.com |password.4 |r2xxxxd2.4  |
