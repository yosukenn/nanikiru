class CategoryTag < ApplicationRecord
  has_many :coordinate_category_tags
  has_many :coordinates, through: :coordinate_category_tags, dependent: :destroy
  validates :name, presence: true
  validates :color, presence: true
  validates :name, uniqueness: {scope: :color}
end
