Feature: User can filter items by category

	As an ESP Lab equipment user
	So that I can easily find an item
    I want to be able to filter the items by selecting a category from a dropdown list of categories

Scenario: Filter by category

	Given I am on the home page8
	Then I should see the "categories_form" form
	When I choose Microscopes and press "Refresh"
	Then I should see4 "Item list was filtered by"