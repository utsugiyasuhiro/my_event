require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      get :new 
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@eventに正しい値が入っていること" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(assigns(:event)).to eq event
    end

    it "edit.html.erbに遷移すること" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@eventに正しい値が入っていること" do
      events = create_list(:event, 3) 
      get :index
      expect(assigns(:events)).to match(events(events.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "index.html.erbに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end