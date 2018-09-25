class CoordinateCategoryTag < ApplicationRecord
  belongs_to :coordinate
  belongs_to :category_tag
end
