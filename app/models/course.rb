class Course < ActiveRecord::Base
  # Model relationships
  belongs_to :user
  belongs_to :study_plan
  has_many   :outlines,    :dependent => :destroy
  has_many   :assignments, :dependent => :destroy
  has_many   :sections,    :dependent => :destroy
  has_many   :materials,   :dependent => :destroy

  attr_accessible :description, :name, :url
  
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
