class AddContentTypeToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :content_type, :string
    add_column :outlines, :content_id, :integer
  end
end
