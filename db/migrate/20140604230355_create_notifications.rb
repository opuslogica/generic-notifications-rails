class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.string :payload_json

      t.references :person, index: true
      t.references :notification_type, index: true
      t.integer :associated_id, index: false, foreign_key: false
      t.string :associated_type

      t.datetime :delivered_at
      t.timestamps
    end
  end
end
