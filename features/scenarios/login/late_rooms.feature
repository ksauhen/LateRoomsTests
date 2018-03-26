Feature: Late Rooms

  Scenario Outline: Check results for some locations
    Given Late Rooms home page is opened
    When I search for a room to stay
      | location   | checkin    | checkout   | occupancy |
      | <location> | in 3 weeks | in 4 weeks | 1 Adult   |
    Then I will see some hotels in list
    Examples:
      | location |
      | London   |
      | Berlin   |