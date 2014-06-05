class NotificationMailer < ActionMailer::Base
  def notification_email(notification,email)
    @email = email
    @notification = notification
    @from = GenericNotificationsRails.config.email_from
    
    subject_pref = GenericNotificationsRails.config.email_subject
    
    if subject_pref
      @subject = instance_exec &subject_pref
    else
      @subject = "Notification from #{Rails.application.class.parent_name}"
    end
    
    mail(to: @email.address, subject: @subject)
  end
end
