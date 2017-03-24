# Preview all emails at http://localhost:3000/rails/mailers/klass_notification
class KlassNotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/klass_notification/klass_created
  def klass_created
    KlassNotification.klass_created
  end

end
