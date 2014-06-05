require 'delivery/base'

module GenericNotificationsRails
  module Delivery
    class Email < Base
      def deliver(notification,email)
        NotificationMailer.notification_email(notification,email)
      end
    end
  end
end
