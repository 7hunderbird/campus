class AddFieldsToSections < ActiveRecord::Migration
  def change
    add_column :sections, :course_id, :integer
    add_column :sections, :description, :text
  end
end
