class AdminController < ApplicationController
  skip_before_filter :authorize

  def show
    user=User.find(params[:user_id])
  end
end
