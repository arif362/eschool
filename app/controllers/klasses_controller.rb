class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]

  def index
    @klasses= Klass.all
  end

  def new
    @klass=Klass.new
  end

  def create
    @klass = Klass.new(klass_params)
    respond_to do |format|
      if @klass.save
        format.html { redirect_to klasses_path, notice: 'Class created successfully' }
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
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:time, :course, :room_no, :place, :teacher, :duration)
  end
end
