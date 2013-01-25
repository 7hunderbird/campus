class StudyPlan < ActiveRecord::Base
  attr_accessible :due_date, :name

  validates :name, presence: true

  belongs_to :user
end
