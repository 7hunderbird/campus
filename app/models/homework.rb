class Homework < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :user
  belongs_to :enrollment
end
