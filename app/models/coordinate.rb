class Coordinate < ApplicationRecord
  belongs_to :gender
  belongs_to :user
  has_many :color-tags, through: coordinate_color-tags
  has_many :category-tags, through: coordinate_category-tags
end
