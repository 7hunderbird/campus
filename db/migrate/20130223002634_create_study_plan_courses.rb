class CreateStudyPlanCourses < ActiveRecord::Migration
  def change
    create_table :study_plan_courses do |t|
      t.integer :study_plan_id
      t.integer :course_id

      t.timestamps
    end
  end
end
