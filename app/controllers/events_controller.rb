class EventsController < ApplicationController

  def index
    @events = Event.includes(:user).order('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event.nil?
      redirect_to root_path, alert: 'Event not found.'
    end
    # @comment = Comment.new
    # @comments = @event.comments
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :occurred_on, :location, :cause_type_id, :detailed_cause, :resolution, :images).merge(user_id: current_user.id)
  end

end


