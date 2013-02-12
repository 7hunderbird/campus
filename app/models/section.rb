class Section < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :name, :description
end
