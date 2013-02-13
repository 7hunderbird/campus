class AddOutlineColumns < ActiveRecord::Migration
  def change
    add_column :assignments, :outline_id, :integer
    add_column :materials, :outline_id, :integer
    add_column :sections, :outline_id, :integer
  end
end
