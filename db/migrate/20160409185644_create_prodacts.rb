class CreateProdacts < ActiveRecord::Migration
  def change
    create_table :prodacts do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :color
      t.belongs_to :model
      t.timestamps null: false
    end
  end
end
