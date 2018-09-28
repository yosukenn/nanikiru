class Coordinate < ApplicationRecord
  belongs_to :gender
  belongs_to :user
  has_many :color_tags, through: :coordinate_color_tags
  has_many :category_tags, through: :coordinate_category_tags
  validates :name, presence: true
end
