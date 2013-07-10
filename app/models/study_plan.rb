class StudyPlan < ActiveRecord::Base
  # Model relationships
  belongs_to :user

  has_many   :study_plan_courses
  has_many   :courses, :through => :study_plan_courses

  attr_accessible :due_date, :name

  validates :name, presence: true

end
