class AddAssignmentIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assignment_id, :integer
  end
end
