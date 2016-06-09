require 'rails_helper'

RSpec.describe SchoolhousesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the schoolhouses instance variable' do
      get :index
      expect(assigns(:schoolhouses)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'has schoolhouses in the schoolhouses instance variable' do
      3.times { |index| Schoolhouse.create(name: "name_#{index}", enrollment: 500, level: 'Elementary') }
      get :index
      expect(assigns(:schoolhouses).length).to eq(3)
      expect(assigns(:schoolhouses).last.name).to eq('name_2')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :show, id: schoolhouse.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :show, id: schoolhouse.id
      expect(response).to render_template(:show)
    end

    it 'sets the country instance variable' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :show, id: schoolhouse.id
      expect(assigns(:schoolhouse).name).to eq(schoolhouse.name)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'set the schoolhouse instance variable' do
      get :new
      expect(assigns(:schoolhouse)).to_not eq(nil)
    end
  end

  describe 'POST #create' do
    it 'sets the schoolhouse instance variable' do
      schoolhouse_params = {schoolhouse: {name: 'Orrington', enrollment: 500, level: 'Elementary'}}
      post :create, schoolhouse_params
      expect(assigns(:schoolhouse)).to_not eq(nil)
      expect(assigns(:schoolhouse).name).to eq(schoolhouse_params[:schoolhouse][:name])
    end

    it 'creates a new schoolhouse' do
      schoolhouse_params = {schoolhouse: {name: 'Orrington', enrollment: 500, level: 'Elementary'}}
      expect(Schoolhouse.count).to eq(0)
      post :create, schoolhouse_params
      expect(Schoolhouse.count).to eq(1)
      expect(Schoolhouse.first.name).to eq(schoolhouse_params[:schoolhouse][:name])
    end

    it 'redirects to the show page on success' do
      schoolhouse_params = {schoolhouse: {name: 'Orrington', enrollment: 500, level: 'Elementary'}}
      post :create, schoolhouse_params
      expect(response).to redirect_to(schoolhouse_path(Schoolhouse.first))
    end

    it 'renders the new template on fail' do
      schoolhouse_params = {schoolhouse: {name: '', enrollment: 500, level: 'Elementary'}}
      post :create, schoolhouse_params
      expect(Schoolhouse.count).to eq(0)
      expect(response).to render_template(:new)
    end

    it 'sets the flash success on successful create' do
      schoolhouse_params = {schoolhouse: {name: 'Orrington', enrollment: 500, level: 'Elementary'}}
      post :create, schoolhouse_params
      expect(flash[:success]).to eq('School created!')
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :edit, id: schoolhouse.id
      expect(response).to have_http_status(:success)
    end

    it 'renders edit template' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :edit, id: schoolhouse.id
      expect(response).to render_template(:edit)
    end

    it 'sets country instance variable' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      get :edit, id: schoolhouse.id
      expect(assigns(:schoolhouse).id).to eq(schoolhouse.id)
    end
  end

  describe 'PUT #update' do
    it 'sets the schoolhouse instance variable' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      put :update, {id: schoolhouse.id, schoolhouse: {name: 'Haven'}}
      expect(assigns(:schoolhouse)).to_not eq(nil)
      expect(assigns(:schoolhouse).reload.name).to eq(schoolhouse.reload.name)
    end

    it 'updates the schoolhouse' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      put :update, {id: schoolhouse.id, schoolhouse: {name: 'Haven'}}
      expect(schoolhouse.reload.name).to eq('Haven')
    end

    it 'redirects to the show page on success' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      put :update, {id: schoolhouse.id, schoolhouse: {name: 'Haven'}}
      expect(response).to redirect_to(schoolhouse_path(Schoolhouse.first))
    end

    it 'renders the edit template on fail' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      put :update, {id: schoolhouse.id, schoolhouse: {name: ''}}
      expect(response).to render_template(:edit)
    end

    it 'sets the flash success on update' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      put :update, {id: schoolhouse.id, schoolhouse: {name: 'Haven'}}
      expect(flash[:success]).to eq('School updated!')
    end
  end

  describe 'DELETE #destroy' do
    it 'sets the schoolhouse instance variable' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      delete :destroy, id: schoolhouse.id
      expect(assigns(:schoolhouse)).to eq(schoolhouse)
    end

    it 'destroys the schoolhouse successfully' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      expect(Schoolhouse.count).to eq(1)
      delete :destroy, id: schoolhouse.id
      expect(Schoolhouse.count).to eq(0)
    end

    it 'sets the flash success message' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      delete :destroy, id: schoolhouse.id
      expect(flash[:success]).to eq('School deleted!')
    end

    it 'redirects to the index path after destroy' do
      schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
      delete :destroy, id: schoolhouse.id
      expect(response).to redirect_to(schoolhouses_path)
    end
  end
end
