class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
