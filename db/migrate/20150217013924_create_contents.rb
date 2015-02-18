class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.boolean :complete
      t.decimal :cost
      t.datetime :created_at
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
