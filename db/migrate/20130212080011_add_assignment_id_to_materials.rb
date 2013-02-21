class AddAssignmentIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :assignment_id, :integer
  end
end
