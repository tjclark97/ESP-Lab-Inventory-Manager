Feature: User can edit the condition from the show specific item page

	As an ESP Lab Inventory Manager
    So that I can edit my current inventory
    I want to be able to change the condition from the item page

Scenario: Update item condition (happy path)

	Given I am at the the show_specific_item1 page
	When I click "Change Condition"
	Then I should see the item "was successfully updated."
