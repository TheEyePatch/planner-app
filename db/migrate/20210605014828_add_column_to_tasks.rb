class AddColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :completed, :boolean, default: 0
  end
end
