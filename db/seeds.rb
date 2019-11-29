# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = [{:category => 'Microscopes', :name => 'AmScope B490 Compound Microscope', :quantity => '3', :condition => '10', :available => '1', :description => 'Device to view small structures', :purchase_link => 'amazon.com', :serial => 'XYZ'},
         {:category => 'Microscopes', :name => 'AmScope B490 Compound Microscope', :quantity => '3', :condition => '9', :available => '0', :description => 'Device to view small structures', :purchase_link => 'amazon.com', :serial => '123'},
         {:category => 'Microscopes', :name => 'AmScope B490 Compound Microscope', :quantity => '3', :condition => '8', :available => '1', :description => 'Device to view small structures', :purchase_link => 'amazon.com', :serial => 'ABC'}
  	 ]

items.each do |item|
  Item.create!(item)
end

categories = [{:name => 'Microscopes'}]

categories.each do |category|
  Category.create!(category)
end
