Feature: User can create an item

	As an ESP Lab equipment user
	So that I can easily create an item

Scenario: View an item (happy path)

	Given I am on InventoryManager1 home page
	Then I should see the "Add new item" link
	When I click "Add new item1" 
	Then I should get1 "Add a New Item"
	When I press1 "Save Changes"
	Then I should see that "was successfully created."