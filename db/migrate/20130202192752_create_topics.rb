class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
    end
  end
end
