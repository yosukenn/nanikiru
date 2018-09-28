class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @coordinates = Coordinate.order('updated_at DESC')
    respond_to do |format|
      format.html
      format.json
    end
  end
end
