class CoordinatesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :create

  def index
    if params[:gender_id] && params[:color_tag] && params[:category_tag]
      @coordinates =
        Coordinate.joins(:category_tags).where("gender_id = :gender_id AND category_tags.color LIKE :color_tag AND category_tags.name LIKE :category_tag", {gender_id: params[:gender_id].to_i, color_tag: "%#{params[:color_tag]}%", category_tag: "%#{params[:category_tag]}%"}).order('updated_at DESC')
    else
      @coordinates = Coordinate.order('updated_at DESC')
    end
  end

  def create
    @coordinate = Coordinate.new(name: coordinate_params[:coordinate_name], image: coordinate_params[:coordinate_image], gender_id: coordinate_params[:gender_id], user_id: current_user.id)
    items = []

    coordinate_params[:coordinate_items].each do |coordinate_item|
      if coordinate_item[:category_name] != '' && coordinate_item[:category_color] != '' && !CategoryTag.find_by(name: coordinate_item[:category_name], color: coordinate_item[:category_color])
        @coordinate.category_tags.build(name: coordinate_item[:category_name], color: coordinate_item[:category_color])
      elsif category = CategoryTag.find_by(name: coordinate_item[:category_name], color: coordinate_item[:category_color])
        @coordinate.category_tags << category
      end
    end

    if @coordinate.save
      render :show, status: :created
    else
      render json: @coordinate.errors, status: :unprocessable_entity
    end
  end

  def show
    @coordinate = Coordinate.find(params[:id].to_i)
    @categorys = @coordinate.category_tags
  end

  def update
  end

  def destroy
    coordinate = Coordinate.find(params[:id])
    if coordinate.destroy
      head :no_content
    else
      render json: coordinate.errors, status: :unprocessable_entity
    end
  end

  private
  def coordinate_params
    params.fetch(:params, {}).permit(
      :gender_id, :coordinate_name, :coordinate_image, coordinate_items: [:category_name, :category_color]
    )
  end
end
