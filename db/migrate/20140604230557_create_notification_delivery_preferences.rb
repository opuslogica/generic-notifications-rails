class CreateNotificationDeliveryPreferences < ActiveRecord::Migration
  def change
    create_table :notification_delivery_preferences do |t|
      t.references :notification_type, index: true
      t.references :person, index: true
      t.integer :destination_id, index: false, foreign_key: false
      t.string :destination_type

      t.timestamps
    end
  end
end
