class CourseKlassListsController < ApplicationController
  before_action :set_course_klass_list, only: [:show, :edit,:update,:delete]
  def index
    @course_klass_lists=CourseKlassList.all
  end

  def new
    @course_klass_list = CourseKlassList.new
  end

  def create
    @klass=current_klass
    course= Course.find(params[:course_id])
    @course_klass_list= @klass.course_klass_lists.build(:course => course)
    respond_to do |format|
      if @course_klass_list.save
        format.html {redirect_to @course_klass_list.klass, notice: 'course_klass_list created successfully'}
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course_klass_list.update(course_klass_list_params)
        format.html {redirect_to course_klass_list_path, notice: ' Updated successfully'}
      end
    end
  end
  def destroy
    @course_klass_list.destroy
    respond_to course_klass_lists_path, notice: 'Deleted successfully'
  end

  private
  def set_course_klass_list
    @course_klass_list = CourseKlassList.find(params[:id])
  end
  def course_klass_list_params
    params.require(:course_klass_list).permit(:course_id,:klass_id)
  end

end
