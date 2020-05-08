class Events::SearchesController < ApplicationController

  def index
    @events = Event.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
