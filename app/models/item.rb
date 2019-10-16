class Item < ActiveRecord::Base
	@all_categories = {}

	def self.get_updated_categories
		@all_categories
	end

	def self.get_categories
		@all_categories = { "Microscopes" => true, "Googles" => true, "Incubators" => true, "Lasers" => true }
	end

	def self.with_categories(categories)
		puts "From Model categories = ", categories
		self.where({category: categories})
	end
end
