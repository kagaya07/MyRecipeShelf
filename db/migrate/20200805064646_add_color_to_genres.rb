class AddColorToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :color, :string
  end
end
