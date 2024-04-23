class EventsController < ApplicationController
  def index
  end

  def new
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :occurred_on, :location, :cause_type_id, :detailed_cause, :resolution, :images).merge(user_id: current_user.id)
  end

end


