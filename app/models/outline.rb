class Outline < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :order_number, :course_id, :content_type, :content_id
end
