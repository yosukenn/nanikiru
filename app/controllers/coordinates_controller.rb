class CoordinatesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :create

  def index
    if params[:gender_id] && params[:color_tag] && params[:category_tag]
      @coordinates = Coordinate.joins(:category_tags).where("gender_id = :gender_id AND category_tags.color LIKE :color_tag AND category_tags.name LIKE :category_tag", {gender_id: params[:gender_id].to_i, color_tag: "%#{params[:color_tag]}%", category_tag: "%#{params[:category_tag]}%"})
    else
      @coordinates = Coordinate.order('updated_at DESC')
    end
  end

  def create
    @coordinate = Coordinate.new(name: coordinate_params[:coordinate_name], image: coordinate_params[:coordinate_image], gender_id: coordinate_params[:gender_id], user_id: current_user.id)
    items = []

    coordinate_params[:coordinate_items].each do |coordinate_item|
      item = @coordinate.category_tags.build(name: coordinate_item[:category_name], color: coordinate_item[:category_color])
      if item.valid?
        items << item
      end
    end

    if @coordinate.save
      items.each do |item|
        item.save
      end
      render :show, status: :created
    else
      render json: @coordinate.errors, status: :unprocessable_entity
    end
  end

  private
  def coordinate_params
    params.fetch(:params, {}).permit(
      :gender_id, :coordinate_name, :coordinate_image, coordinate_items: [:category_name, :category_color]
    )
  end
end
