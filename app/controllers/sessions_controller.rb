class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    if user= User.authenticate(params[:user_name], params[:password])
      session[:user_id]=user.id
      redirect_to user_path(user), notice: 'Login successfully '
    else
      redirect_to login_url, alert: 'Invalid User Name or Password'
    end
  end


  def admin_login
  end

  def add
    if school= School.authenticate(params[:email], params[:password])
      session[:school_id]=school.id
      redirect_to school_path(school), notice: 'Login successfully'
    else
      redirect_to admin_login_url, alert: 'Invalid email address or Password'
    end
  end

  def destroy
    session[:user_id]=nil
    session[:school_id]=nil
    redirect_to schools_path, notice: 'You have logeged out successfully'
  end
end
