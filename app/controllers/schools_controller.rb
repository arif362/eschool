class SchoolsController < ApplicationController
  before_action :set_school, only: [:show]
  def index
    @schools=School.all
  end
  def new
    @school = School.new
  end
  def create
    @school = School.new(school_params)
    respond_to do |format|
      if @school.save
        format.html {redirect_to schools_path, notice: 'You have created a School Successfully'}
      end
    end
  end
  def show
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name,:address,:registration_no,:country,:admin,:email,:mobile)
  end
end
