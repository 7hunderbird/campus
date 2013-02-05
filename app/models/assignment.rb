class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :tasks, :dependent => :destroy
  
  attr_accessible :due_date, :title, :url
end
