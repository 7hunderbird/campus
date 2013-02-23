class StudyPlanCourse < ActiveRecord::Base
  # Model relationships
  belongs_to :study_plan
  belongs_to :courses

  attr_accessible :course_id, :study_plan_id

end
