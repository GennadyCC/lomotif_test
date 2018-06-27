Feature: User can LogIn to app

  Background:
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button
    And I tap Sign up link

  @signup_invalid_email_format
  Scenario: I cannot Sign up with invalid Email format
    # after Background steps
    Then I try to provide emails with invalid format and see message "Oops, the email must be in correct format"

  @signup_valid_email_format
  Scenario: I can Sign up with valid Email format
    # after Background steps
    Then I provide email with valid format and see message "Username must be between 3 to 30 characters."

  @signup_invalid_username_format
  Scenario: I cannot Sign up with invalid Username format
    # after Background steps
    Then I provide username with invalid format and see message with word "Username"

  @signup_valid_username_format
  Scenario: I can Sign up with valid Username format
    # after Background steps
    Then I provide username with valid format and see message "Password must be a minimum of 8 characters."

  @signup_invalid_password_format
  Scenario: I cannot Sign up with invalid password format
    # after Background steps
    Then I provide password with invalid format and see message "Password must be a minimum of 8 characters."

  @signup_valid_password_format
  Scenario: I can Sign up with valid password format
    # after Background steps
    Then I provide password with valid format and there is no error message "Password must be a minimum of 8 characters."