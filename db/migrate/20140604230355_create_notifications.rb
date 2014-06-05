class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.string :payload_json

      t.references :person, index:true
      t.references :type, index: true

      t.timestamps
    end
  end
end
