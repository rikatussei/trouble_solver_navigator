class UsersController < ApplicationController
  def show
    logger.debug "Params: #{params.inspect}"
    @user = User.find_by(id: params[:id])  # Use find_by instead of find
    if @user.nil?
      # Handle user not found case (e.g., redirect to login page)
      return redirect_to new_user_session_path, alert: "Invalid user ID"
    end
    @events = @user.events
  end
end