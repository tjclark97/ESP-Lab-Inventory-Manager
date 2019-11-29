Feature: Items on specific item page should be checked in or out

	As an ESP Lab equipment user
	So that I can check in and check out items

Scenario: View an item (happy path)

	Given I am on specific item page
	When I see "Yes" of a specific item in availibility field
	Then I should check in item by using the "CI" button