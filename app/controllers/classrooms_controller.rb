class ClassroomsController < ApplicationController
before_action :schoolhouse
before_action :classroom, except: [:index, :new, :create]

  def index
  	@classrooms = @schoolhouse.classrooms
  end

  def show
  end

  def new
  	@classroom = Classroom.new
  end

  def create
  	@classroom = @schoolhouse.classrooms.create(classroom_params)
  	if @classroom.save
  		redirect_to schoolhouse_classroom_path(@schoolhouse, @classroom)
  	else
  		render :new
  	end
  end

  def update
  	if @classroom.update(classroom_params)
  		redirect_to schoolhouse_classroom_path(@schoolhouse, @classroom)
  	else
  		render :edit
  	end
  end

  def edit
  end

  def destroy
  	@classroom.destroy
  	redirect_to schoolhouse_path(@schoolhouse)
  end

  private

  def classroom_params
  	params.require(:classroom).permit(:name, :teacher, :size)
  end

  def classroom
  	@classroom = schoolhouse.classrooms.find(params[:id])
  end

  def schoolhouse
    @schoolhouse = Schoolhouse.find(params[:schoolhouse_id])
  end
end
