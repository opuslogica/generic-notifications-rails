class CreateNotificationTypes < ActiveRecord::Migration
  def change
    create_table :notification_types do |t|
      t.string :name
      t.string :description
      t.integer :code

      t.timestamps
    end
  end
end
