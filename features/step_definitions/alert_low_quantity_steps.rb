Given("I am at the home page") do
    visit '/'
end

When("{string} has a quantity below 5") do |name|
    @item = name
end

Then("I should see a notice above the table") do
    visit '/'
end