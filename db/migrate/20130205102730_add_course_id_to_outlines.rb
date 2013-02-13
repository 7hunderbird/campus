class AddCourseIdToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :course_id, :integer
  end
end
