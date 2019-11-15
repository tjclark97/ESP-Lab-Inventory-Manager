class Item < ActiveRecord::Base
	@all_categories = {}
	@item_list = []
	@all_items

	def self.get_updated_categories
		@all_categories
	end

	def self.get_categories
		@temp = ["Microscopes", "Goggles", "Incubators", "Lasers"]
		@all_categories = @temp.sort {|a,b| a<=>b}
		@all_categories = ["All"] + @all_categories

	end

	def self.with_categories(categories)
		all_items = self.where({category: categories})

		previous_names = []
		index_list = []
		all_items.each do |item|
			if !(previous_names.include? item.name)
				index_list << item
			end

			previous_names << item.name
		end

		index_list
	end

	def self.specific_item_list(specific_item_name)
		@item_list = self.where({name: specific_item_name})
	end

	def self.get_item_quantity(specific_item_name)
		self.where({name: specific_item_name}).count
	end
end
