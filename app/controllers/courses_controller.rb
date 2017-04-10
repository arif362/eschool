class CoursesController < ApplicationController
  skip_before_filter :authorize
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses=current_school.courses
  end

  def new
    @course = current_school.courses.new
  end

  def create
    @course = current_school.courses.build(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'New course added successfully' }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_path, notice: 'Course updated successfully' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @course.destroy
        format.html { redirect_to courses_path, confirm: 'Do you realy delete this course?' }
      end
    end
  end

  private
  def set_course
    @course=current_school.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :author)
  end
end
