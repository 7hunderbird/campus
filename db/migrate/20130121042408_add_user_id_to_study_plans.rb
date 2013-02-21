class AddUserIdToStudyPlans < ActiveRecord::Migration
  def change
    add_column :study_plans, :user_id, :integer
  end
end
