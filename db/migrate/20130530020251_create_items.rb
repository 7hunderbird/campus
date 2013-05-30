class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.text :desc
      t.string :variety
      t.integer :library_id

      t.timestamps
    end
  end
end
