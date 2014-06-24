require 'json'

class Notification < ActiveRecord::Base
  belongs_to :type
  belongs_to :person
  
  belongs_to :associated, polymorphic: true

  after_create :increment_badge
  after_create :deliver
  
  def increment_badge
    person.notification_badge_count = (person.notification_badge_count||0) + 1
    person.save
  end

  def deliver
    begin
      if person.devices.length > 0
        device_delivery = GenericNotificationsRails::Delivery::Device.new
        person.devices.each do |d|
          device_delivery.deliver(self, d)
        end
      else
        email_deliver = GenericNotificationsRails::Delivery::Email.new
        email_deliver.deliver(self, person.emails.first)
      end
      
      self.delivered_at = DateTime.now
      save
    rescue SocketError => x
      logger.error "Error delivering notification: #{x}"
    end
  end

  def payload
    JSON.parse payload_json rescue nil
  end

  def payload= obj
    self.payload_json = (obj&&obj.to_json) || nil
  end
end
