require "active_support/dependencies"
require "generic_notifications_rails/engine"
require "generic_notifications_rails/config"
require "delivery/email"
require "delivery/device"

require_dependency GenericNotificationsRails::Engine.root.join("app","models","person").to_s

module GenericNotificationsRails
  def self.config(&block)
    if block
      block.call(GenericNotificationsRails::Config)
    else
      GenericNotificationsRails::Config
    end
  end
end
