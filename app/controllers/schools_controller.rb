class SchoolsController < ApplicationController
  skip_before_filter :authorize
  before_action :set_school, only: [:show, :edit, :update]

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
        KlassNotification.school_created(@school).deliver_now
        format.html { redirect_to admin_login_url, notice: 'A Confirmation Message sent to your Gmail Account. Please Check' }
      else
        format.html { redirect_to new_school_path, notice: 'Failed to Sign Up for this School, Try again.' }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to school_path(@school), notice: 'Updated Successfully' }
      end

    end
  end


  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :address, :registration_no, :country, :admin, :email, :password, :password_confirmation, :mobile)
  end
end
