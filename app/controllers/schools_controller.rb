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
    respond_to do |format|
      format.html
      format.js {render :layout => "fadein"}
    end
  end
  def create
    @school = current_user.schools.build(school_params)
    if @school.save
      redirect_to school_path(@school.id)
    else
      render :action => "new"
    end
  end
def generate
    @school = School.find(params[:id])
    @school.generate_pupil
  end
  def sort
    @school = School.find(params[:id])
    @school.sort_pupils
    @pupils = @school.pupils.all
  end
  private
  def school_params
    params.require(:school).permit(:title, :num_of_grades)
  end
end
