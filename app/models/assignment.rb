class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :tasks, :dependent => :destroy
  has_many :materials, :dependent => :destroy
  
  validates_presence_of :name, :message => "can't be blank"
  
  attr_accessible :due_date, :name, :url, :description
end
