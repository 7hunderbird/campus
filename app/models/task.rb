class Task < ActiveRecord::Base
  attr_accessible :title, :body, :complete
end
