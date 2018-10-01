class AddColorToCategoryTag < ActiveRecord::Migration[5.1]
  def change
    add_column :category_tags, :color, :string

    add_index :category_tags, [:name, :color], unique: true
  end
end
