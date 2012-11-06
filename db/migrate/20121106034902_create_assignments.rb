class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :url
      t.date :due_date
      t.string :title

      t.timestamps
    end
  end
end
