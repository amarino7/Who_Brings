class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.string :key
      t.integer :user_id
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
