class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name, null: false, default: ''
      t.string :color, null: false, default: ''
      t.timestamps null: false
    end
  end
end
