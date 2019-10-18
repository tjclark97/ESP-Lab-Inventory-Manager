Feature: User will be notified if any item is at a low quantity level

	As an ESP Lab Inventory Manager
    So that I can know when an item is at low quantity and needs more ordered
    I want to be alerted from the inventory manager overview that an item is below a threshold quantity

Scenario: An item is at low quantity

	Given I am at the home page
	When "AmScope B490 Compound Microscope" has a quantity below 5
	Then I should see a notice above the table