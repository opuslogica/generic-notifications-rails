class NotificationDeliveryPreference < ActiveRecord::Base
  belongs_to :notification_type
  belongs_to :person
  belongs_to :destination, :polymorphic => true
end
