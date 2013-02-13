class ChangeSomeColumns < ActiveRecord::Migration
  def change
    rename_column :assignments, :title, :name
    rename_column :materials, :content, :description
    rename_column :materials, :assignment_id, :course_id
  end
end
