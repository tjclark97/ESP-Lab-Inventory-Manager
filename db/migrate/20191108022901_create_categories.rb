class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :items, :category_id, :integer
    add_index :items, :category_id
  end
end
