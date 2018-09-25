class CreateCoordinateColorTags < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinate_color_tags do |t|
      t.references :coordinate, null: false, foreign_key: true
      t.references :color_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
