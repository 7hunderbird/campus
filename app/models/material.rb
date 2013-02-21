class Material < ActiveRecord::Base
  belongs_to :outline
  belongs_to :assignments
  
  attr_accessible :name, :description
end
