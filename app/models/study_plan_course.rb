class StudyPlanCourse < ActiveRecord::Base
  # Model relationships
  belongs_to :study_plan
  belongs_to :course

  attr_accessible :course_id, :study_plan_id

end
