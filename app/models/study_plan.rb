class StudyPlan < ActiveRecord::Base
  # Model relationships
  belongs_to :user
  has_many   :study_plan_courses
  has_many   :courses, :through => :study_plan_courses

  attr_accessible :due_date, :name

  validates :name, presence: true

  # Search capability through elasticsearch (backend) and tire (gem)
  include Tire::Model::Search
  include Tire::Model::Callbacks

  # Search method for search controller
  def self.search(params)
    tire.search(load:true) do
      query { string params[:query]} if params[:query].present?    
    end
  end
    
end
