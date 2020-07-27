class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.integer :recipe_id
      t.string :image_id
      t.text :body

      t.timestamps
    end
  end
end
