class Assignment < ActiveRecord::Base
  belongs_to :course
  
  validates_presence_of :name, :message => "can't be blank"
  
  attr_accessible :due_date, :name, :url, :description
end
