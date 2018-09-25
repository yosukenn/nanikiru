class CoordinateColorTag < ApplicationRecord
  belongs_to :coordinate
  belongs_to :color_tag
end
