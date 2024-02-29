Feature: User select cities and see their timezones

  Scenario: User select one citie
    When I visit our page
    And I check Hawaii checkbox
    And I click the "submit timezone" button
    Then I see text: Time Information:
    And I see text: UTC: 2024
    And I see text: Hawaii: 2024

  Scenario: User select 5 cities
    When I visit our page
    And I check Hawaii checkbox
    And I check London checkbox
    And I check Fiji checkbox
    And I check Athens checkbox
    And I check Hanoi checkbox
    And I click the "submit timezone" button
    Then I see text: Time Information:
    And I see text: UTC: 2024
    And I see text: Hawaii: 2024
    And I see text: London: 2024
    And I see text: Fiji: 2024
    And I see text: Athens: 2024
    And I see text: Hanoi: 2024

  Scenario: User select all cities
    When I visit our page
    And I check Hawaii checkbox
    And I check London checkbox
    And I check Fiji checkbox
    And I check Athens checkbox
    And I check Hanoi checkbox
    And I check Santiago checkbox
    And I check Edinburgh checkbox
    And I check Sydney checkbox
    And I check Kyiv checkbox
    And I check Zurich checkbox
    And I click the "submit timezone" button
    Then I see text: Time Information:
    And I see text: UTC: 2024
    And I see text: Hawaii: 2024
    And I see text: London: 2024
    And I see text: Fiji: 2024
    And I see text: Athens: 2024
    And I see text: Hanoi: 2024
    And I see text: Santiago: 2024
    And I see text: Edinburgh: 2024
    And I see text: Sydney: 2024
    And I see text: Kyiv: 2024
    And I see text: Zurich: 2024
