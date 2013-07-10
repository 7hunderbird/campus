class Course < ActiveRecord::Base

  belongs_to :user

  has_many   :study_plan_courses
  has_many   :study_plans, :through   => :study_plan_courses

  has_many   :outlines,    :dependent => :destroy
  has_many   :assignments, :dependent => :destroy
  has_many   :sections,    :dependent => :destroy
  has_many   :materials,   :dependent => :destroy
  has_many   :enrollments, :dependent => :destroy

  attr_accessible :description, :name, :url

  def enrolled(user)
    Enrollment.where(:user_id => user.id, :course_id => self.id).any?
  end

end
