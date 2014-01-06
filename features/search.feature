Feature: Search Page
  Search for deals should work for user and admin both

Background:
  Given I visit home page
  And I close the subscription popup

Scenario: search form
  Then I should see search form

Scenario: search for deals should autosuggest
  And I enter "limit" in search field
  Then I should see search suggestions

Scenario: clicking on autosuggest result should take to deatil page
  And I enter "limit" in search field
  And I click auto suggest serach result
  Then I should be on deal details page

Scenario: search deals with title
  And I enter "limit" in search field
  And I click search button
  Then I should see search results containing "limit" word

Scenario: search deals with wrong title
  And I enter "xyxyxyxyxyxyxyx" in search field
  And I click search button
  Then I should see suggestion to modify search

Scenario: search deals with keyword should autosuggest
  And I enter "test" in search field
  Then I should see search suggestions

Scenario: clicking on autosuggest result for keyword should take to deatil page
  And I enter "test" in search field
  And I click auto suggest serach result
  Then I should be on deal details page

Scenario: search deals by keyword
  And I enter "test" in search field
  And I click search button
  Then I should see search results containing "test" word
