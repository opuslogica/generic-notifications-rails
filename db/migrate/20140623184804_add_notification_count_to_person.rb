class AddNotificationCountToPerson < ActiveRecord::Migration
  def change
    add_column :people , :notification_badge_count, :integer
  end
end
