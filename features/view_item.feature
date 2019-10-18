Feature: User can view details of a specific item

	As an ESP Lab equipment user
	So that I can easily view the details of a piece of equipment
	I want to view item details by clicking on the item name

Scenario: View an item (happy path)

	Given I am on InventoryManager home page
	Then I should see the "Name" category
	When I press "Specific Equipment Name" 
	Then I should see "Item details"