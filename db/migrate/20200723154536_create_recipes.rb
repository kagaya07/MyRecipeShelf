class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name
      t.integer :amount
      t.text :explanation
      t.boolean :is_valid, default: true
      t.string :image_id

      t.timestamps
    end
  end
end
