class CoordinatesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:create, :update]

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
      if coordinate_item[:name] != '' && coordinate_item[:color] != '' && !CategoryTag.find_by(name: coordinate_item[:name], color: coordinate_item[:color])
        @coordinate.category_tags.build(name: coordinate_item[:name], color: coordinate_item[:color])
      elsif category = CategoryTag.find_by(name: coordinate_item[:name], color: coordinate_item[:color])
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
    # <ActionController::Parameters {"params"=>{"coordinate_name"=>"モノトーンストリート", "coordinate_items"=>[{"name"=>"ブルゾン", "color"=>"ブラック"}, {"name"=>"スウェット", "color"=>"グレー"}, {"name"=>"スニーカー", "color"=>"グレー"}]}, "format"=>:json, "controller"=>"coordinates", "action"=>"update", "id"=>"8", "coordinate"=>{}} permitted: false>
    @coordinate = Coordinate.find(params[:id])
    @categorys = @coordinate.category_tags
    if @coordinate.update(name: coordinate_params[:coordinate_name])
      render :show, status: :ok
    else
      render json: @coordinate.errors, status: :unprocessable_entity
    end
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
      :gender_id, :coordinate_name, :coordinate_image, coordinate_items: [:name, :color]
    )
  end
end
