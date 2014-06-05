module GenericNotificationsRails
  module Delivery
    class Base
      def deliver(message,device)
        raise "Unknown delivery type"
      end
    end
  end
end
