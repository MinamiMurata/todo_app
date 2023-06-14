class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :integer, default: false, null: false
  end
end
