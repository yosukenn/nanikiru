class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    # binding.pry
    # "gender_id"=>"1", "color_tag"=>"ブラック", "category_tag"=>"ジャケット"
    @coordinates = Coordinate.order('updated_at DESC')
  end

end
