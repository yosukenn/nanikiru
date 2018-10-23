class CategoryTagsController < ApplicationController
  protect_from_forgery except: :create

  def create
    coordinate = Coordinate.find(category_tag_params[:id])
    @category_tag = coordinate.category_tags.build(category_tag_params[:coordinate_item])
    binding.pry
    if @category_tag.save
      render :show, status: :created
    else
      render json: @category_tag.errors, status: :unprocessable_entity
    end
  end

  private
  def category_tag_params
    params.permit(
      :id, coordinate_item: [:name, :color]
    )
  end
end
