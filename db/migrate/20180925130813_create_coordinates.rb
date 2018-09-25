class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.string :name
      t.references :gender, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :coordinates, :name
  end
end
