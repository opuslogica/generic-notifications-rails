class AddDeliveredAtFieldToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications , :delivered_at , :datetime
  end
end
