class StudyPlanCourses < ActiveRecord::Base
  # Model relationships
  belongs_to :study_plan
  belongs_to :courses
  
end
