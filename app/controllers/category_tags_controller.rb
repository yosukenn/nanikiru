class CategoryTagsController < ApplicationController
  protect_from_forgery except: :create

  def create
    coordinate = Coordinate.find(category_tag_params[:id])

    if @category_tag = CategoryTag.find_by(category_tag_params[:coordinate_item])
      if coordinate.category_tags << @category_tag
        render :show, status: :created
      else
        render json: @category_tag.errors, status: :unprocessable_entity
      end
    elsif @category_tag = CategoryTag.new(category_tag_params[:coordinate_item])
      if coordinate.category_tags << @category_tag
        render :show, status: :created
      else
        render json: @category_tag.errors, status: :unprocessable_entity
      end
    end
    @category_tag = coordinate.category_tags.build(category_tag_params[:coordinate_item])
  end

  private
  def category_tag_params
    params.permit(
      :id, coordinate_item: [:name, :color]
    )
  end
end
