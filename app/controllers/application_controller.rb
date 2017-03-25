class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception

  private

  def current_klass
    Klass.find(session[:klass_id])
  rescue ActiveRecord::RecordNotFound
    klass=Klass.create
    session[:klass_id]=klass.id
    klass
  end

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
