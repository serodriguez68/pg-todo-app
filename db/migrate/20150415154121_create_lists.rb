class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, limit: 30
      t.text :description, limit: 60

      t.timestamps null: false
    end
  end
end
