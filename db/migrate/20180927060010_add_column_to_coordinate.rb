class AddColumnToCoordinate < ActiveRecord::Migration[5.1]
  def change
    add_column :coordinates, :image, :string, :after => :name, null: false
  end
end
