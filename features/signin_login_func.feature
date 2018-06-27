Feature: User can LogIn to app

  Background:
    Given I go to LogIn screen
    When I tap the SignUp/LogIn button


@signup_valid_data
Scenario Outline: I can Sign up if I provide valid data
    # after Background steps
And I tap Sign up link
Then I provide "<unique>" "<email>", "<password>" and "<username>"
And I tap the Sign up button
Then I can see "<username>" on top of the screen
And I close application

Examples:
|email              |password      |username   |unique   |
|testmail@gmail.com |testpassword  |testuser   |11       |
|testmail@gmail.com |testpassword  |testuser   |12       |


@login_valid_data
Scenario Outline: I can LogIn if I provide valid Username and Password
    # after Background steps
And I tap LogIn link
Then I provide "<unique>" "<email>" and "<password>"
And I tap LogIn button
Then I can see "<username>" on top of the screen
And I close application

Examples:
|email              |password     |username  |unique   |
|testmail@gmail.com |testpassword |testuser  |11       |

@login_invalid_data
Scenario Outline: I cannot LogIn if I provide valid Username and Password from different accounts
    # after Background steps
And I tap LogIn link
Then I provide "<unique_1>" "<email>" and "<unique_2>" "<password>"
And I tap LogIn button
Then I can see message "Login Failed"
And I close application

Examples:
|email              |password     |unique_1|unique_2|
|testmail@gmail.com |testpassword |11      |12      |