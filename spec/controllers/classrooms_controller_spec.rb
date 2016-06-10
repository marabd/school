require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
    end

    it "returns http success" do
      get :index, schoolhouse_id: schoolhouse.id
      expect(response).to have_http_status(:success)
    end

    it 'sets the classrooms instance variable' do
      get :index
      expect(assigns(:schoolhouse.classrooms)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
