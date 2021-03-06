@sample
@javascript
Feature:
  In order to edit items in Hydra
  As an archivist
  I need add and edit subjects

  Scenario: Single subjects
    Given I am logged in as "archivist1@example.com"
    And I am on the subjects workflow page for cucumber:1
    And I fill in "lc_subject_0" with "Foo"
    And I fill in "lc_genre_0" with "Bar"
    When I press "Save Changes"
    Then the "lc_subject_0" field should contain "Foo"
    And the "lc_genre_0" field should contain "Bar"
    And I should see "Video was updated successfully"

  Scenario: No changes are made
    Given I am logged in as "archivist1@example.com"
    And I am on the subjects workflow page for cucumber:1
    When I press "Save Changes"
    Then I should see "No changes made"

  Scenario: Auto-suggest values
    Given I am logged in as "archivist1@example.com"
    And I am on the subjects workflow page for cucumber:1
    And I fill in "lc_subject_0" with "ABBA"
    And I wait for 8 seconds
    Then I should see "ABBA (Musical group)"
    And I fill in "lc_genre_0" with "Rock"
    And I wait for 5 seconds
    Then I should see "Rock concert films."
    And I should see "Rock music."
    And I should see "Rock"

