class Item < ActiveRecord::Base
	@all_categories = {}
	@item_list = []

	def self.get_updated_categories
		@all_categories
	end

	def self.get_categories
		@all_categories = { "Microscopes" => true, "Goggles" => true, "Incubators" => true, "Lasers" => true }
	end

	def self.with_categories(categories)
		puts "From Model categories = ", categories
		self.where({category: categories})
	end

	def self.specific_item_list(specific_item_name)
		@item_list = self.where({name: specific_item_name})
	end
end
