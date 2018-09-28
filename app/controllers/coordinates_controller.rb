class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @coordinates = Coordinate.order('updated_at DESC')
  end
end
