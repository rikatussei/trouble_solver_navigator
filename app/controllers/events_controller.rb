class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.includes(:user, images_attachments: :blob).order('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'イベントが作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @event.comments
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'イベントが更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      redirect_to root_path, notice: 'イベントが削除されました。'
    else
      redirect_to root_path, alert: 'イベントの削除に失敗しました。'
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def ensure_correct_user
    redirect_to root_path, alert: 'アクセス権がありません。' unless @event.user == current_user
  end

  def event_params
    params.require(:event).permit(:title, :description, :occurred_on, :location, :cause_type_id, :detailed_cause, :resolution, images: []).merge(user_id: current_user.id)
  end
end
