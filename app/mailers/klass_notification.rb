class KlassNotification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.klass_notification.klass_created.subject
  #
  def klass_created(klass)
    @klass= klass
    mail(to: klass.email, subject: 'New Class Created confirmation')
  end

  def school_created(school)
    @school= school
    mail(to: school.email, subject: 'School Created successfully')
  end

  def user_created(user)
    @user= user
    mail(to: user.email, subject: 'User Account Created successfully')
  end

  def invite_created(invitation)
    @invitation=invitation
    mail(to: invitation.email, subject: 'Welcome To E-School')
  end


end
