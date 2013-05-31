class Item < ActiveRecord::Base
  belongs_to :library

  attr_accessible :desc, :library_id, :title, :url, :variety
end
