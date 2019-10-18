Given("I am on InventoryManager1 home page") do
  visit '/'
end

Then("I should see the {string} link") do |string|
  visit '/'
end

When("I click {string}") do |string|
  visit '/'
end

Then("I should get1 {string}") do |string|
  visit '/items/new/'
end

When("I press1 {string}") do |string|
  visit '/'
end

Then("I should see that {string}") do |string|
  visit '/items/'
end