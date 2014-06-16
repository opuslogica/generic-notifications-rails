require 'json'

class Notification < ActiveRecord::Base
  belongs_to :type
  belongs_to :person
  
  belongs_to :associated, polymorphic: true
  after_save :deliver
  
  def deliver
    begin
      if person.devices.length > 0
        device_delivery = GenericNotificationsRails::Delivery::Device.new
        person.devices.each do |d|
          device_delivery.deliver self,d
        end
      else
        email_deliver = GenericNotificationsRails::Delivery::Email.new
        email_deliver.deliver self,person.emails.first
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
