class ColorTag < ApplicationRecord
  has_many :coordinates, through: :coordinate_color_tags
  validates :name, presence: true
end
