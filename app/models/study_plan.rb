class StudyPlan < ActiveRecord::Base
  attr_accessible :due_date, :name

  validates :name, presence: true

  belongs_to :user

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
