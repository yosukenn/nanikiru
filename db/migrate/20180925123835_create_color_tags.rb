class CreateColorTags < ActiveRecord::Migration[5.1]
  def change
    create_table :color_tags do |t|
      t.string :name, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
