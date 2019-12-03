Given("I am on the home page8") do
  visit '/'
end

Then("I should see the {string} form") do |string|
  visit '/'
end

When("I choose Microscopes and press {string}") do |string|
  visit '/'
end

Then("I should see4 {string}") do |string|
  visit '/items'
end