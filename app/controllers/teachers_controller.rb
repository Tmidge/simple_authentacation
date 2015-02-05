class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update]
  before_action :authenticate_user

  def edit
  end

  def create
  end

  def update
    if params[:commit] == 'Change Name'
      @current_user.name = params[:teacher][:name]
      @current_user.save!
      redirect_to teachers_path
    elsif @current_user.update(teacher_params)
      redirect_to teachers_path, notice: 'User info was successfully updated.'
    else
      render :edit
    end
  end

  def index
    @teachers = Teacher.all
  end

  private

    def teacher_params
      params.require(:teacher).permit( :name, :password)
    end

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def set_login

    end
end
