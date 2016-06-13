class SchoolhousesController < ApplicationController
  before_action :schoolhouse, except: [:index, :new, :create]

  def index
  	@schoolhouses = Schoolhouse.all
  end
  
  def show
    @classrooms = @schoolhouse.classrooms
  end

  def new
  	@schoolhouse = Schoolhouse.new
  end

  def create
  	@schoolhouse = Schoolhouse.new(schoolhouse_params)
  	if @schoolhouse.save
  		flash[:success] = 'School created!'
  		redirect_to schoolhouse_path(@schoolhouse)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @schoolhouse.update(schoolhouse_params)
  		flash[:success] = 'School updated!'
  		redirect_to schoolhouse_path(@schoolhouse)
  	else
  		render :edit
  	end
  end

  def destroy
  	@schoolhouse.destroy
  	flash[:success] = 'School deleted!'
  	redirect_to schoolhouses_path
  end

  private

  def schoolhouse
  	@schoolhouse = Schoolhouse.find(params[:id])
  end

  def classroom
    @classroom = Classroom.find(params[:id])
  end

  def schoolhouse_params
  	params.require(:schoolhouse).permit(:name, :enrollment, :level)
  end
end
