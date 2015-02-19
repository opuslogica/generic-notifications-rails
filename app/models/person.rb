require_dependency GenericPeopleRails::Engine.root.join('app', 'models', 'person').to_s

class Person
  has_many :notifications, dependent: :destroy
  has_many :notification_delivery_preferences, dependent: :destroy
end
