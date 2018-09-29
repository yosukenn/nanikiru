class CoordinatesController < ApplicationController
  before_action :authenticate_user!

  def index
    # binding.pry
    @coordinates = Coordinate.order('updated_at DESC')
  end

end
