Feature: Items on specific item page should be splited

	As an ESP Lab equipment user
	So that I can view items on seperated pages

Scenario: View an item (happy path)

	Given I am on show specific item list page
	When I see number of "items" is greater than 10
	Then I should click the "Next" button