class CreateCoordinateCategoryTags < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinate_category_tags do |t|
      t.references :coordinate, null: false, foreign_key: true
      t.references :category_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
