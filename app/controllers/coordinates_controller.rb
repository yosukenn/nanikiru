class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:gender_id] && params[:color_tag] && params[:category_tag]
      @coordinates = Coordinate.joins(:category_tags).where("gender_id = :gender_id AND category_tags.color LIKE :color_tag AND category_tags.name LIKE :category_tag", {gender_id: params[:gender_id].to_i, color_tag: "%#{params[:color_tag]}%", category_tag: "%#{params[:category_tag]}%"})
    else
      @coordinates = Coordinate.order('updated_at DESC')
    end
  end

  def create
  end
end
