Feature:
  In order to display video content
  As a public user
  I need to view the content of a video

  Scenario: Viewable metadata (DAM-131)
    Given I am on the show archival video page for rockhall:fixture_pbcore_document1
    And I should see the field title "blacklight-title_display" contain "Main Title"
    And I should see the field content "blacklight-title_display" contain "Rock and Roll Hall of Fame induction ceremony. Part 1."
    And I should see the field title "blacklight-alternative_title_display" contain "Alternative Title"
    And I should see the field content "blacklight-alternative_title_display" contain "[Tape label title] Induction ceremony, line cut reel #20A, 03/15/99."
    And I should see the field title "blacklight-summary_display" contain "Summary"
    And I should see the field content "blacklight-summary_display" contain "(1 of 3) Uncut performances and award presentations from the 1999 ceremony."
    And I should see the field title "blacklight-subject_facet" contain "Subject"
    And I should see the field content "blacklight-subject_facet" contain "Rock and Roll Hall of Fame and Museum."
    And I should see the field content "blacklight-subject_facet" contain "Rock music--History and criticism."
    And I should see the field content "blacklight-subject_facet" contain "Inductee"
    And I should see the field content "blacklight-subject_facet" contain "Rock musicians."
    And I should see the field title "blacklight-genre_facet" contain "Genre"
    And I should see the field content "blacklight-genre_facet" contain "Award presentations (Motion pictures)"
    And I should see the field content "blacklight-genre_facet" contain "Rock concert films."
    And I should see the field title "blacklight-series_display" contain "Event Series"
    And I should see the field content "blacklight-series_display" contain "Rock and Roll Hall of Fame and Museum. Annual induction ceremony. 1999."
    And I should see the field title "blacklight-event_place_display" contain "Event Place"
    And I should see the field content "blacklight-event_place_display" contain "New York, NY"
    And I should see the field title "blacklight-event_date_display" contain "Event Date"
    And I should see the field content "blacklight-event_date_display" contain "1999-03-15"
    And I should see the field title "blacklight-note_display" contain "Note"
    And I should see the field content "blacklight-note_display" contain "http://rockhall.com/inductees/ceremonies/1999/"
    And I should see the field title "blacklight-contributor_name_facet" contain "Contributor"
    And I should see the field content "blacklight-contributor_name_facet" contain "Springsteen, Bruce"
    And I should see the field content "blacklight-contributor_name_facet" contain "McCartney, Paul"
    And I should see the field content "blacklight-contributor_name_facet" contain "Joel, Billy"
    And I should see the field content "blacklight-contributor_name_facet" contain "Brown, Charles, 1922-1999"
    And I should see the field content "blacklight-contributor_name_facet" contain "Mayfield, Curtis"
    And I should see the field content "blacklight-contributor_name_facet" contain "Shannon, Del"
    And I should see the field content "blacklight-contributor_name_facet" contain "Springfield, Dusty"
    And I should see the field content "blacklight-contributor_name_facet" contain "Staple Singers"
    And I should see the field content "blacklight-contributor_name_facet" contain "Pickett, Wilson"
    And I should see the field title "blacklight-publisher_name_facet" contain "Publisher"
    And I should see the field content "blacklight-publisher_name_facet" contain "Rock and Roll Hall of Fame Foundation"
    And I should see the field title "blacklight-creation_date_display" contain "Creation Date"
    And I should see the field content "blacklight-creation_date_display" contain "1999-03-15"
    And I should see the field title "blacklight-barcode_display" contain "Barcode"
    And I should see the field content "blacklight-barcode_display" contain "39156042551098"
    And I should see the field title "blacklight-repository_display" contain "Repository"
    And I should see the field content "blacklight-repository_display" contain "2809 Woodland Ave."
    And I should see the field title "blacklight-media_format_facet" contain "Format"
    And I should see the field content "blacklight-media_format_facet" contain "Betacam"
    And I should see the field title "blacklight-standard_display" contain "Standard"
    And I should see the field content "blacklight-standard_display" contain "NTSC"
    And I should see the field title "blacklight-media_type_display" contain "Media Type"
    And I should see the field content "blacklight-media_type_display" contain "Moving image"
    And I should see the field title "blacklight-generation_display" contain "Generation"
    And I should see the field content "blacklight-generation_display" contain "Original"
    And I should see the field title "blacklight-language_display" contain "Language"
    And I should see the field content "blacklight-language_display" contain "eng"
    And I should see the field title "blacklight-colors_display" contain "Colors"
    And I should see the field content "blacklight-colors_display" contain "Color"
    And I should see the field title "blacklight-collection_facet" contain "Archival Collection"
    And I should see the field content "blacklight-collection_facet" contain "Rock and Roll Hall of Fame and Museum Records. Education and Public Programs Division."
    And I should see the field title "blacklight-archival_series_display" contain "Archival Series"
    And I should see the field content "blacklight-archival_series_display" contain "Audiovisual Materials"
    And I should see the field title "blacklight-collection_number_display" contain "Collection Number"
    And I should see the field content "blacklight-collection_number_display" contain "ARC.0002"
    And I should see the field title "blacklight-accession_number_display" contain "Accession Number"
    And I should see the field content "blacklight-accession_number_display" contain "LA.2003.01.001"
    And I should see the field title "depositor_facet" contain "Depositor"
    And I should see the field content "depositor_facet" contain "archivist1@example.com"
    And I should see the field title "reviewer_facet" contain "Reviewer"
    And I should see the field content "reviewer_facet" contain "reviewer1@example.com"
    And I should see the field title "license_display" contain "License"
    And I should see the field content "license_display" contain "Public"

  Scenario: Message for unavailable video (DAM-200)
    Given I am on the document page for id rockhall:fixture_pbcore_document1
    Then I should see "Video not available"  

  @wip
  Scenario: Displaying role terms in view mode (DAM-217)
    Given I am on the show archival video page for rockhall:fixture_pbcore_document1
    Then I should see the field content "blacklight-contributor_name_facet" contain "Springsteen, Bruce (recipient)"

  @javascript
  Scenario: Displaying video playlist (DAM-229)
    Given I am on the the document page for id rockhall:fixture_pbcore_digital_document1
    Then I should see "Part 1" in the playlist
    And I should see "Part 2" in the playlist
    And I should see "Part 3" in the playlist
