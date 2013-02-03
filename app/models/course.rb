class Course < ActiveRecord::Base
  has_many :assignments
  
  attr_accessible :description, :name, :url
end
