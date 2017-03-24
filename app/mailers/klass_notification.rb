class KlassNotification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.klass_notification.klass_created.subject
  #
  def klass_created(klass)
    @klass= klass
    mail(to: klass.email, subject:'New Class Created confirmation')
  end
end
