class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :prodact
      t.integer :count, null: false, default: 0
      t.belongs_to :store
      t.integer :type_of_sale
      t.belongs_to :sate_type
      t.float :price, null: false, default: 0
      t.timestamps null: false
    end
  end
end
