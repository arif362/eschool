class UsersController < ApplicationController
  skip_before_filter :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy, :invite]

  def index
    @users= current_school.users.all
  end

  def student_list
    @users= current_school.users.all.where(role: User::USER_ROLE[:student])
  end

  def teacher_list
    @users=current_school.users.all.where(role: User::USER_ROLE[:teacher])
  end

  def parent_list
    @parents=current_school.users.all.where(role: User::USER_ROLE[:parent])
  end

  def new
    if current_school.present?
      @user = current_school.users.new
    else
      @user=User.new
      @schools=School.all
    end
  end

  def create
    if current_school.present?
      @user=current_school.users.build(user_params)
    else
      @user=User.new(user_params)
    end
    respond_to do |format|
      if @user.save
        KlassNotification.user_created(@user).deliver_now
        if session[:school_id].present?
          format.html { redirect_to users_path, notice: 'A Confirmation Message sent to his/her Gmail Account. Login your email and password' }
        else
          format.html { redirect_to login_path, method: :post, notice: 'A Confirmation Message sent to your Gmail Account. Please Check' }
        end
      else
        format.html { redirect_to new_user_path, notice: 'Please enter your details correctly.' }
      end
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
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :role, :password, :school_id, :password_confirmation)
  end

  def set_user
    @user=current_school.users.find(params[:id])
  end
end
