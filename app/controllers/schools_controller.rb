class SchoolsController < ApplicationController

  def index
    @schools = current_user.schools.all
    #debugger
  end
  def new
    @school = current_user.schools.build
    #debugger
  end
  def show
    @school = School.find(params[:id])
  end
  def create
    @school = current_user.schools.build(school_params)
    if @school.save
      redirect_to school_path(@school.id)
    else
      render :action => "new"
    end
  end
  def sort
    @school = School.find(params[:id])
    @school.sort_pupils
  end
  private
  def school_params
    params.require(:school).permit(:title, :num_of_grades)
  end
end
