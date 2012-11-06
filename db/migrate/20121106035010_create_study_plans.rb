class CreateStudyPlans < ActiveRecord::Migration
  def change
    create_table :study_plans do |t|
      t.string :name
      t.date :due_date

      t.timestamps
    end
  end
end
