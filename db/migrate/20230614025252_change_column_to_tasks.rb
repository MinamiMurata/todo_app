class ChangeColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :deadline, false
    change_column_null :tasks, :content, false
  end
end
