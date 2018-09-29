class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    # binding.pry
    # "gender_id"=>"1", "color_tag"=>"ブラック", "category_tag"=>"ジャケット"
    if params[:gender_id] || params[:color_tag] || params[:category_tag]
    else
      @coordinates = Coordinate.order('updated_at DESC')
    end
  end

end
