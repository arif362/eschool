class InvitationsController < ApplicationController
  skip_before_filter :authorize

  def new
    @invitation=Invitation.new
  end

  def create
    @invitation= Invitation.new(invitation_params)
    respond_to do |format|
      if @invitation.save
        KlassNotification.invite_created(@invitation).deliver
        format.html {redirect_to users_path, notice: 'Your invitation sent successfully'}
        else
        format.html {render :new}
      end
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:email)
  end

end
