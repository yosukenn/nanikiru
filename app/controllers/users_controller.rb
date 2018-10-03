class UsersController < ApplicationController
  def index
    @coordinates = current_user.coordinates.order('updated_at DESC')
  end
end
