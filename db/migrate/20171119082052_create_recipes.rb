class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :title, null: false
      t.text :making_time, null: false
      t.text :serves, null: false
      t.text :ingredients, null: false
      t.integer :cost, null: false
      t.timestamps null: false
    end
  end
end
