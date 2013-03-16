class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks, :dependent => :destroy
  
  validates_presence_of :name, :message => "can't be blank"
  
  attr_accessible :due_date, :name, :url, :description
  
  def user_homework(user)
    self.homeworks.where(:user_id => user.id).first
  end
end
