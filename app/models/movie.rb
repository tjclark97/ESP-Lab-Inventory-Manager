class Movie < ActiveRecord::Base
	@all_ratings = {}

	def self.get_updated_ratings
		@all_ratings
	end

	def self.get_ratings
		@all_ratings = { "G" => true, "PG" => true, "PG-13" => true, "R" => true }
	end

	def self.with_ratings(ratings)
		puts "From Model ratings = ", ratings
		self.where({rating: ratings})
	end
end
