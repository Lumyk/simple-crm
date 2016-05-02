class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :percent
      t.timestamps null: false
    end
  end
end
