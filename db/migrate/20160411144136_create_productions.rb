class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.belongs_to :prodact
      t.integer :count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :master, null: false, default: ''
      t.timestamps null: false
    end
  end
end
