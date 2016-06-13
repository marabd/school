require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  before(:each) do
    @schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, schoolhouse_id: @schoolhouse.id
      expect(response).to have_http_status(:success)
    end

    it 'sets the classroom instance variable' do
      get :index, schoolhouse_id: @schoolhouse.id
      classroom = @schoolhouse.classrooms.create(name: '3rd Grade', size: '20', teacher: 'Ms. Robertson')
      expect(assigns(:classrooms)).to eq([classroom])
    end

    it 'renders the index template' do
      get :index, schoolhouse_id: @schoolhouse.id
      expect(response).to render_template(:index)
    end
  end


  describe "GET #edit" do
    before(:each) do
      @classroom = @schoolhouse.classrooms.create(name: '3rd Grade', size: '20', teacher: 'Ms. Robertson')
    end

    it "returns http success" do
      get :edit, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(response).to have_http_status(:success)
    end

    it 'finds the right classroom' do
      get :edit, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(assigns(:classroom)).to eq(@classroom)
    end

    it 'renders edit template' do
      get :edit, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #show" do
    before(:each) do
      @classroom = @schoolhouse.classrooms.create(name: '3rd Grade', size: '20', teacher: 'Ms. Robertson')
    end

    it "returns http success" do
      get :show, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(response).to have_http_status(:success)
    end

    it 'sets classroom instance var' do
      get :show, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(assigns(:classroom)).to eq(@classroom)
    end

    it 'renders show template' do
      get :show, schoolhouse_id: @schoolhouse.id, id: @classroom.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      @classroom = @schoolhouse.classrooms.create(name: '3rd Grade', size: '20', teacher: 'Ms. Robertson')
    end

    it "returns http success" do
      get :new, schoolhouse_id: @schoolhouse.id
      expect(response).to have_http_status(:success)
    end

    it 'sets classroom instance variable' do
      get :new, schoolhouse_id: @schoolhouse.id
      @classroom = assigns[:classroom]
      expect(@classroom.id).to eq(nil)
    end

    it 'renders new template' do
      get :new, schoolhouse_id: @schoolhouse.id
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before(:each) do
      @classroom_params = 
      {classroom: {name: '3rd Grade', size: '20', teacher: 'Ms. Robertson'}}
    end

    it 'sets the classroom instance variable' do
      post :create, @classroom_params, schoolhouse_id: @schoolhouse.id
      expect(assigns(:classroom)).to_not eq(nil)
      expect(assigns(:classroom).name).to eq(@classroom_params[:classroom][:name])
    end

    it 'creates a new classroom' do
      expect(@schoolhouse.classrooms.count).to eq(0)
      post :create, @classroom_params, schoolhouse_id: @schoolhouse.id
      expect(@schoolhouse.classrooms.count).to eq(1)
    end
  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
  end





end
