class UsersController < ApplicationController
  skip_before_filter :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy,:invite]

  def index
    @users= User.all
  end

  def student_list
    @users= User.all.where("role='Student'")
  end

  def teacher_list
    @users=User.all.where("role='Teacher'")
  end

  def parent_list
    @parents=User.all.where("role='Parent'")
  end

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    respond_to do |format|
      if @user.save
        KlassNotification.user_created(@user).deliver
        format.html { redirect_to schools_path, notice: 'A Confirmation Message sent to your Gmail Account. Please Check' }
      end
    end
  end

  def invite
    respond_to do |format|
      KlassNotification.invite_created(@user).deliver
      format.html { redirect_to users_path, notice: 'Invitation Sent to Your User' }
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Updated successfully' }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Deleted successfully'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :role, :password, :password_confirmation)
  end

  def set_user
    @user=User.find(params[:id])
  end
end
