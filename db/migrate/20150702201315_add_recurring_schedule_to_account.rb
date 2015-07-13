class AddRecurringScheduleToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :recurring_schedule, :text
  end
end
