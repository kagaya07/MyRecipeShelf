class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.boolean :is_vaild, default: true

      t.timestamps
    end
  end
end