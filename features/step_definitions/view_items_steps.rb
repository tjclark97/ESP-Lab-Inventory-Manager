Given("I am on InventoryManager home page") do
  visit '/'
end

Then("I should see the {string} category") do |string|
  visit '/'
end

When("I press {string}") do |string|
  visit '/'
end

Then("I should see {string}") do |string|
  visit '/items/'
end