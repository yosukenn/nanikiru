class CategoryTag < ApplicationRecord
  has_many :coordinates, through: coordinate_category_tags
end
