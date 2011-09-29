Feature:
  In order to catalog video content
  As a library staff user
  I need add and remove different pbcore nodes from documents

  Scenario: Add a new nodes enter information
    Given I am logged in as "archivist1@example.com"
    And I create a new archival_video
    And I press "Add contributor"
    Then I should see "Contributor Name:"
    And I should see "Contributor Role:"
    And I should see "Contributor Ref:"
    And I fill in "asset[descMetadata][contributor_0_name][0]" with "John Doe"
    And I fill in "asset[descMetadata][contributor_0_role][0]" with "test_role"
    And I fill in "asset[descMetadata][contributor_0_role_ref][0]" with "test_role_ref"
    And I press "Save Document"
    Then I should see "John Doe"
    And I should see "test_role"
    And I should see "test_role_ref"
    And I press "Delete contributor John Doe"
    Then I should not see "Contributor Name:"
    And I should not see "Contributor Role:"
    And I should not see "Contributor Ref:"
    And I press "Add publisher"
    Then I should see "Publisher Name:"
    And I should see "Publisher Role:"
    And I should see "Publisher Ref:"
    And I fill in "asset[descMetadata][publisher_0_name][0]" with "Jane Doe"
    And I fill in "asset[descMetadata][publisher_0_role][0]" with "test_pub_role"
    And I fill in "asset[descMetadata][publisher_0_role_ref][0]" with "test_pub_role_ref"
    And I press "Save Document"
    Then I should see "Jane Doe"
    And I should see "test_pub_role"
    And I should see "test_pub_role_ref"
    And I press "Delete publisher Jane Doe"
    Then I should not see "Publisher Name:"
    And I should not see "Publisher Role:"
    And I should not see "Publisher Ref:"
    And I press "Add genre"
    Then I should see "Genre Name:"
    And I should see "Genre Ref:"
    And I fill in "asset[descMetadata][genre_0][0]" with "Test Genre"
    And I fill in "asset[descMetadata][genre_0_ref][0]" with "genre_ref"
    And I press "Save Document"
    Then I should see "Test Genre"
    And I should see "genre_ref"
    And I press "Delete genre Test Genre"
    Then I should not see "Genre Name:"
    And I should not see "Genre Ref:"
    And I press "Add topic"
    Then I should see "Topic Name:"
    And I should see "Topic Ref:"
    And I fill in "asset[descMetadata][topic_0][0]" with "Test Topic"
    And I fill in "asset[descMetadata][topic_0_ref][0]" with "topic_ref"
    And I press "Save Document"
    Then I should see "Test Topic"
    And I should see "topic_ref"
    And I press "Delete topic Test Topic"
    Then I should not see "Topic Name:"
    And I should not see "Topic Ref:"
    And I press "Add contributor"
    Then I should see "Contributor Name:"
    And I press "Delete contributor #1"
    Then I should not see "Contributor Name:"