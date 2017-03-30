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
    @user = User.new
  end

  def create
    if current_school.present?
      @user=current_school.users.build(user_params)
    else
      @user=User.new(user_params)
    end

    respond_to do |format|
      if @user.save
        KlassNotification.user_created(@user).deliver
        format.html { redirect_to login_url, notice: 'A Confirmation Message sent to your Gmail Account. Please Check' }
      else
        format.html { render :new }
      end
    end
  end

  # def invite
  #   respond_to do |format|
  #     KlassNotification.invite_created(@user).deliver
  #     format.html { redirect_to users_path, notice: 'Invitation Sent to Your User' }
  #   end
  # end

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
