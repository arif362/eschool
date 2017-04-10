class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception
  helper_method :current_school, :current_user, :current_students


  # def current_klass
  #   Klass.find(session[:klass_id])
  # rescue ActiveRecord::RecordNotFound
  #   klass=Klass.create
  #   session[:klass_id]=klass.id
  #   klass
  # end

  def current_school
    School.find(session[:school_id])
  rescue ActiveRecord::RecordNotFound
    if current_user.present?
      school = current_user.school
      session[:school_id]=school.id
      school
    end
  end

  # def current_course
  #   Course.find(session[:course_id])
  # rescue ActiveRecord::RecordNotFound
  # end

  def current_user
    User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
  end

  def current_students
    current_school.users.where(role: User::USER_ROLE[:student])
  end

  private
  def authorize
    if School.find_by_id(session[:school_id])
      redirect_to school_path
    else
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: 'Please Login'
      end
    end

  end

end
