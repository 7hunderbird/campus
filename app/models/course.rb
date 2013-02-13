class Course < ActiveRecord::Base
  has_many :outlines, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :materials, :dependent => :destroy
  
  attr_accessible :description, :name, :url
end
