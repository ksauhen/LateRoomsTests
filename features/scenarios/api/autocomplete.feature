@api
Feature: Late Rooms autocomplete API

  Scenario: I want to check auto complete returns results
    When I call autocomplete API for 'Chica'
    Then I will see the first result for 'Chicago'

  Scenario: I want to check auto complete returns results
    When I call autocomplete API for 'Chica'
    Then I will see the response matches schema