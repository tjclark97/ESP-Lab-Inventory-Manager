Given("I am on show specific item list page") do
  visit '/items/23/show_specific_item_list/wtfdd'
end

When("I see number of {string} is greater than 10") do |string|
  visit '/'
end

Then("I should click the {string} button") do |string|
  visit '/items/23/show_specific_item_list/wtfdd?page=2'
end