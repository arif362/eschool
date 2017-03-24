class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_klass
    Klass.find(session[:klass_id])
  rescue ActiveRecord::RecordNotFound
    klass=Klass.create
    session[:klass_id]=klass.id
    klass
  end
end
