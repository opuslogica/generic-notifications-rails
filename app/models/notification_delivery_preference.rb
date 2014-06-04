class NotificationDeliveryPreference < ActiveRecord::Base
  belongs_to :type
  belongs_to :person
end
