class EventsController < ApplicationController

  before_action :set_event. only: [:show, :edit]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
  end

  def show
  end

  private
  def event_params
    params.require(:event).permit(:name, :image, :text)
  end

  def set_event
    @event = Event.find(params[:id]) 
  end
end
