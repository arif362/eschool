class UserAssignCoursesController < ApplicationController
  skip_before_filter :authorize

  def index
    @assigned_courses= UserAssignCourse.all
    @teachers= current_school.users.where(role: User::USER_ROLE[:teacher])
    @users=current_school.users.where(role: User::USER_ROLE[:student])
    @courses= Course.search(current_school, params[:user_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @course = Course.find_by_id(params[:course_id])
  end

  def create
    @course = Course.find_by_id(params[:course_id])
    begin
      params[:student_ids].each do |student_id|
        @course.user_assign_courses.build(user_id: student_id).save
      end
      respond_to do |format|
        format.html { redirect_to courses_path, notice: 'Successfully assigned' }
      end
    rescue
      redirect_to new_user_assign_course_path(course_id: @course), notice: 'There is a problem of course assigning. Please check..'
    end


  end

  private
  def user_assign_course_params
    params.require(:user_assign_course).permit(:course_id, :user_id)
  end
end
