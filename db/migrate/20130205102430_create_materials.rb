class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.text :content

      t.timestamps
    end
  end
end
