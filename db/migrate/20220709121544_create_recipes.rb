class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :book_id
      t.integer :page
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
