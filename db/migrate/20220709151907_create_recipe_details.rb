class CreateRecipeDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_details do |t|
      t.integer :recipe_id
      t.integer :meal_type
      t.integer :prep_time
      t.integer :cook_time
      t.integer :calories
      t.integer :size

      t.timestamps
    end
  end
end
