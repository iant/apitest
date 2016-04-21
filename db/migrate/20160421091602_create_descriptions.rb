class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :item_id
      t.text :body

      t.timestamps null: false
    end
  end
end
