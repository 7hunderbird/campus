class AddEnrollmentIdToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :enrollment_id, :integer
  end
end
