Feature: User can add and remove categories

	As an ESP Lab equipment user
	So that I can better organize the inventory
    I want to be able to add and remove categories

Scenario: View an item (happy path)

	Given I am on the home page
	Then I should see the "Edit categories" link
	When I click on the "Edit categories" link
    Then I should get2 "Add or Remove Categories"
    When I press2 "Update Category List"
	Then I should see that1 "Category list updated"