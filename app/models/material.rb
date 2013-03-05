class Material < ActiveRecord::Base
  # Model relationships
  belongs_to :outline
  belongs_to :assignment
  
  attr_accessible :name, :description
end
