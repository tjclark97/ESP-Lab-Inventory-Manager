class Item < ActiveRecord::Base
	@all_categories = {}
	@item_list = []

	def self.get_updated_categories
		@all_categories
	end

	def self.get_categories
		@temp = ["Microscopes", "Goggles", "Incubators", "Lasers"]
		@all_categories = @temp.sort {|a,b| a<=>b}
		@all_categories = ["All"] + @all_categories
	end

	def self.with_categories(categories)
		puts "From Model categories = ", categories
		self.where({category: categories})
	end

	def self.specific_item_list(specific_item_name)
		@item_list = self.where({name: specific_item_name})
	end
end
