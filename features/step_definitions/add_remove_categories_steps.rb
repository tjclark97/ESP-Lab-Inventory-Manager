Given("I am on the home page") do
    visit '/'
  end
  
  Then("I should see the {string} link") do |string|
    visit '/'
  end
  
  When("I click on the {string} link") do |string|
    visit '/'
  end
  
  Then("I should get2 {string}") do |string|
    visit '/categories/edit'
  end

  When("I press2 {string}") do |string|
    visit '/edit?utf8=✓&categoryAction=Add&categoryName=Category+Name&commit=Update+Category+List'
  end

  Then("I should see that1 {string}") do |string|
    visit '/categories/edit?utf8=✓&categoryAction=Add&categoryName=Category+Name&commit=Update+Category+List'
  end
