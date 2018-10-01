class CategoryTag < ApplicationRecord
  has_many :coordinate_category_tags
  has_many :coordinates, through: :coordinate_category_tags
  validates :name, presence: true
  validates :name, uniqueness: {scope: :color}
end
