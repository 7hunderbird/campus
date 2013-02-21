class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.integer :order_number

      t.timestamps
    end
  end
end
