class DropColorTag < ActiveRecord::Migration[5.1]
  def up
    drop_table :coordinate_color_tags
    drop_table :color_tags
  end

  def down
    create_table :coordinate_color_tags do |t|
      t.references :coordinate, null: false, foreign_key: true
      t.references :color_tag, null: false, foreign_key: true

      t.timestamps
    end

      create_table :color_tags do |t|
      t.string :name, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
