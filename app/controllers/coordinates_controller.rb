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
    @coordinate = Coordinate.new()
    # Parameters: {"params"=>{"gender_id"=>1, "coordinate_name"=>"ミリタリーMIX", "coordinate_image"=>"https://pds.exblog.jp/pds/1/201307/01/88/d0252088_18493327.jpg", "coordinate_items"=>[{"category_class"=>"アウター", "category_name"=>"ロングブルゾン", "category_color"=>"カーキ"}, {"category_class"=>"トップス", "category_name"=>"ニット", "category_color"=>"グレー"}, {"category_class"=>"インナー", "category_name"=>"Tシャツ", "category_color"=>"ホワイト"}, {"category_class"=>"ボトムス", "category_name"=>"スウェットパンツ", "category_color"=>"グレー"}, {"category_class"=>"シューズ", "category_name"=>"ブーツ", "category_color"=>"グレー"}, {"category_class"=>"アクセサリ", "category_name"=>"", "category_color"=>""}]}, "coordinate"=>{}}
  end

  private
  def coordinate_params
    params.fetch(:params, {}).permit(
      :gender_id, :coordinate_name, :coordinate_image, :coordinate_items
    )
  end
end
