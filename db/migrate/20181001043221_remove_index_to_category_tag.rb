class RemoveIndexToCategoryTag < ActiveRecord::Migration[5.1]
  def change
    remove_index :category_tags, :name
    add_index :category_tags, :name
  end
end
