require 'delivery/base'
require 'oli_pusher'

module GenericNotificationsRails
  module Delivery
    class Device < Base
      def deliver(notification,device)
        GenericNotificationsRails::OliPusher.send_notification([ device.identifier ],notification.title,notification.payload)
      end
    end
  end
end
