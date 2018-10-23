class CategoryTagsController < ApplicationController
  protect_from_forgery except: :create

  def create
  end

  private
  def category_tag_params
    params.permit(
      :id, coordinate_item: [:name, :color]
    )
  end
end
