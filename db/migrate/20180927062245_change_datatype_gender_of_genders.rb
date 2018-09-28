class ChangeDatatypeGenderOfGenders < ActiveRecord::Migration[5.1]
  def change
    change_column :genders, :gender, :string
  end
end
