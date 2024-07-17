class UsersController < ApplicationController
  def show
    logger.debug "Params: #{params.inspect}"
    @user = User.find(params[:id])
    @events = @user.events
  end
end