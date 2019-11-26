Given("I am on specific item page") do
  visit '/items/23/show_specific_item_list/wtfdd'
end

When("I see {string} of a specific item in availibility field") do |string|
  visit '/items/23/show_specific_item_list/wtfdd'
end

Then("I should check in item by using the {string} button") do |string|
  visit '/items/23/show_specific_item_list/wtfdd'
end
