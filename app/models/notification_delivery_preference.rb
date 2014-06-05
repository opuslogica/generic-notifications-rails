class NotificationDeliveryPreference < ActiveRecord::Base
  belongs_to :type
  belongs_to :person
  belongs_to :destination, :polymorphic => true
end
