class CreateStudyPlanCourses < ActiveRecord::Migration
  def change
    create_table :study_plan_courses do |t|

      t.timestamps
    end
  end
end
