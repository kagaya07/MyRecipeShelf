class CreateMterials < ActiveRecord::Migration[5.2]
  def change
    create_table :mterials do |t|
      t.integer :recipe_id
      t.string :name
      t.string :puantity

      t.timestamps
    end
  end
end
