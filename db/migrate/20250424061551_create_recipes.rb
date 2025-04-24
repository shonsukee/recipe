class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :making_time, null: false
      t.string :serves, null: false
      t.string :ingredients, null: false
      t.integer :cost, null: false

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
