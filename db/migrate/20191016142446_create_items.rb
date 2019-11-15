class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :name
      t.integer :condition
      t.integer :available
      t.string :description
      t.string :purchase_link
    end
  end
end
