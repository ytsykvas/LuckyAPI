Feature: User can use currency exchange calculator

  Scenario: User can see a table with currencies
    When I visit our page
    Then I see symbols "USD,JPY,EUR,AUD,SGD" in the currency table

  Scenario: User can calculate exchange from USD to UAH
    When I visit our page
    And I fill "EUR" in the currency select box
    And I fill "100" in the amount field
    And I click the "submit exchange" button
    Then I see text: You will get:
    And I see correct result of exchange of "EUR" in amount of "100"

  Scenario: User can calculate exchange from JPY to UAH
    When I visit our page
    And I fill "JPY" in the currency select box
    And I fill "100" in the amount field
    And I click the "submit exchange" button
    Then I see text: You will get:
    And I see correct result of exchange of "JPY" in amount of "100"

  Scenario: User can calculate exchange from AUD to UAH
    When I visit our page
    And I fill "AUD" in the currency select box
    And I fill "100" in the amount field
    And I click the "submit exchange" button
    Then I see text: You will get:
    And I see correct result of exchange of "AUD" in amount of "100"

  Scenario: User can calculate exchange from SGD to UAH
    When I visit our page
    And I fill "SGD" in the currency select box
    And I fill "100" in the amount field
    And I click the "submit exchange" button
    Then I see text: You will get:
    And I see correct result of exchange of "SGD" in amount of "100"

  Scenario: User can calculate exchange from USD to UAH by default
    When I visit our page
    And I fill "100" in the amount field
    And I click the "submit exchange" button
    Then I see text: You will get:
    And I see correct result of exchange of "USD" in amount of "100"
