class CreateSateTypes < ActiveRecord::Migration
  def change
    create_table :sate_types do |t|
      t.string :name, null: false, default: ''
      t.timestamps null: false
    end
  end
end
