class AddCategory < ActiveRecord::Migration
  def change
    if Category.count.zero?
      %w[Microscopes Goggles Incubators Lasers].each do |c|
        Category.create name: c
      end
      Item.all.each do |item|
        c = Category.find_by(name: item.category)
        next if c.nil?
        item.update(category_id: c.id)
      end
    end

  end
end
