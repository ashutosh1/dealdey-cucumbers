Feature: Search Page
  Search for deals should work for user and admin both

Background:
  Given I visit home page
  And I close the subscription popup

Scenario: search form
  Then I should see search form

Scenario: User view autosugestion on search
  And I enter "limit" in search field
  Then I should see search suggestions

Scenario: clicking on autosuggest result should take to deatil page
  And I enter "limit" in search field
  And I click autosuggest serach result
  Then I should be on deal details page

Scenario: search deals with title
  And I search with "limit"
  Then I should see search results
  Then I should see search text "limit"

Scenario: search deals with wrong title
  And I search with "xyxyxyxyxyxyxyx"
  Then I should see "0 item(s) found for xyxyxyxyxyxyxyx"
  Then I should see "Make sure all the words are spelled correctly."
  Then I should see "Try searching for a less specific item."
  Then I should see "You may also want to look at our Top selling categories:"
  Then I should see all categories section

Scenario: User view autosugestion on search by deal's keyword
  And I enter "test" in search field
  Then I should see search suggestions

Scenario: search deals by keyword
  And I search with "test"
  Then I should see search results
  Then I should see search text "test"