class Course < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy
  
  attr_accessible :description, :name, :url
end
