class CreateNotificationDeliveryPreferences < ActiveRecord::Migration
  def change
    create_table :notification_delivery_preferences do |t|
      t.references :type, index: true
      t.references :person, index: true
      t.integer :destination_id
      t.string :destination_type

      t.timestamps
    end
  end
end
