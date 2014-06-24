require 'delivery/base'
require 'oli_pusher'

module GenericNotificationsRails
  module Delivery
    class Device < Base
      def deliver(notification,device)
        options = { badge: notification.person.notification_badge_count }
        GenericNotificationsRails::OliPusher.send_notification([ device.identifier ],notification.title,notification.payload , options)
      end
    end
  end
end
