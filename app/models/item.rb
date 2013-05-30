class Item < ActiveRecord::Base
  attr_accessible :desc, :library_id, :title, :url, :variety
end
