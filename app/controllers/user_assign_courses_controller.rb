class UserAssignCoursesController < ApplicationController
  skip_before_filter :authorize

  def new
    @user_assign_course = UserAssignCourse.new
  end

  def create
    @user=current_user
    course = Course.find(params[:course_id])
    @user_assign_course = @user.user_assign_courses.build(:course=> course)
    respond_to do |format|
      if @user_assign_course.save
        format.html { redirect_to courses_path, notice: 'Course assigned successful' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def user_assign_course_params
    params.require(:user_assign_course).permit(:user_id, :course_id)
  end
end
