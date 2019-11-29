Feature: User can filter items by category

	As an ESP Lab equipment user
	So that I can easily find an item
    I want to be able to filter the items by selecting a category from a dropdown list of categories

Scenario: View an item (happy path)

	Given I am on the home page
	Then I should see the "categories_form" form
	When I choose Microscopes and press "Refresh"
	Then I should see "Item list was filtered by"