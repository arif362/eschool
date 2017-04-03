class KlassesController < ApplicationController
  skip_before_filter :authorize
  before_action :set_klass, only: [:show, :edit, :update, :destroy]

  def index
    @klasses= current_school.klasses.all
  end

  def new
    @klass=Klass.new
    @courses= current_school.courses
    @users=current_school.users.where(role: User::USER_ROLE[:teacher])
  end

  def create
    @klass =current_school.klasses.build(klass_params)
    respond_to do |format|
      if @klass.save
        KlassNotification.klass_created(@klass).deliver_now
        format.html { redirect_to klasses_path, notice: 'Notification has been sent to your Mail. Check Your Gmail to confirm the operation' }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to klass_path, notice: ' Class routine Updated successfully' }
      end
    end
  end

  def destroy
    @klass.destroy
    redirect_to klasses_path, notice: 'Class Deleted successfully'
  end


  private
  def set_klass
    @klass = current_school.klasses.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:time, :course_id, :room_no, :place, :user_id, :email, :duration)
  end
end
