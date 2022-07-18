class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.string :author
      t.string :image

      t.timestamps
    end
  end
end
