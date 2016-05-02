class CreateSklads < ActiveRecord::Migration
  def change
    create_table :sklads do |t|
      t.belongs_to :prodact
      t.integer :count, null: false, default: 0
      t.timestamps null: false
    end
  end
end
