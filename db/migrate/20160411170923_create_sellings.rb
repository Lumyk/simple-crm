class CreateSellings < ActiveRecord::Migration
  def change
    create_table :sellings do |t|
      t.belongs_to :prodact
      t.integer :count, null: false, default: 0
      t.belongs_to :store
      t.float :store_price, null: false, default: 0
      t.float :my_money, null: false, default: 0
      t.timestamps null: false
    end
  end
end
