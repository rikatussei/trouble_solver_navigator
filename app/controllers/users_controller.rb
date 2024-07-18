# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    logger.debug "Params: #{params.inspect}"
    @user = User.find_by(id: params[:id])
    if @user.nil?
      return redirect_to new_user_session_path, alert: "Invalid user ID"
    end
    @events = @user.events
  end
end