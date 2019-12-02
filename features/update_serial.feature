Feature: User can edit the serial from the show specific item page

	As an ESP Lab Inventory Manager
    So that I can edit my current inventory
    I want to be able to change the serial from the item page

Scenario: Update item serial (happy path)

	Given I am at the the show_specific_item2 page
	When I click "Change Serial"
	Then I should see that the item "was successfully updated."
