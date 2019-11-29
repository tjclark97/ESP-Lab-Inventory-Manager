Given("I am on the home page") do
  visit '/'
end

Then("I should see the {string} form") do |string|
  visit '/'
end

When("I choose Microscopes and press {string}") do |string|
  visit '/'
end

Then("I should see {string}") do |string|
  visit '/items?utf8=✓&cat=Microscopes&commit=Refresh'
end