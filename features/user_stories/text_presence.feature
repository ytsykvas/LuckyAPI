Feature: User can see all our text

  Scenario: User visit our page
    When I visit our page
    Then I see text: Candidate: Yurii Tsykvas
    And I see text: What can you do?
    And I see text: 1) to play with timezones:
    And I see text: 2) to convert currency to UAH:
    And I see text: Currency
    And I see text: Exchange Rate
    And I see text: How much UAH will you get?
    And I see text: Count
