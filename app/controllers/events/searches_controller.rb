class Events::SearchesController < ApplicationController

  def index
    @events = Event.search(params[:keyword])
  end
end
