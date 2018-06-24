Feature: User can LogIn to app

  Background:
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button

  @login
  Scenario Outline: I can LogIn if I provide valid Username and Password
    # after Background steps
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
    # after Background steps
    And I tap Sign up link
    Then I provide "<email>", "<password>" and "<username>"
    And I tap the Sign up button
    Then I can see "<username>" on top of the screen
    And I close application

    Examples:
  |email                |password   |username    |
  |r2xxxxd2+5@gmail.com |password.5 |r2xxxxd2.5  |

  @signup_invalid_email_format
  Scenario: I cannot Sign up with invalid Email format
    # after Background steps
    And I tap Sign up link
    Then I try to provide emails with invalid format and see message "Oops, the email must be in correct format"

  @signup_valid_email_format
  Scenario: I can Sign up with valid Email format
    # after Background steps
    And I tap Sign up link
    Then I provide email with valid format and see message "Username must be between 3 to 30 characters."

  @signup_invalid_username
  Scenario: I cannot Sign up with invalid Username format
    # after Background steps
    And I tap Sign up link
    Then I provide username with invalid format and see message with word "Username"



  @signup_valid_username
  Scenario: I can Sign up with valid Username format
    # after Background steps
    And I tap Sign up link
    Then I provide username with valid format and see message "Password must be a minimum of 8 characters."

  @signup_invalid_password
  Scenario: I cannot Sign up with invalid password format
    # after Background steps
    And I tap Sign up link
    Then I provide password with invalid format and see message "Password must be a minimum of 8 characters."

  @signup_valid_password
  Scenario: I can Sign up with valid password format
    # after Background steps
    And I tap Sign up link
    Then I provide password with valid format and there is no error message "Password must be a minimum of 8 characters."