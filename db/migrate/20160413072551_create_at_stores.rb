class CreateAtStores < ActiveRecord::Migration
  def change
    create_table :at_stores do |t|
      t.belongs_to :prodact
      t.belongs_to :store
      t.integer :count, null: false, default: 0
      t.integer :selling_count, null: false, default: 0
      t.timestamps null: false
    end
  end
end
