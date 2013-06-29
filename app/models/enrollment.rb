class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :homeworks, :dependent => :destroy
end
