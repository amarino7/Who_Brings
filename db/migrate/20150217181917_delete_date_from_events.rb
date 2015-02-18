class DeleteDateFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :date
  	remove_column :events, :time
  	add_column :events, :start_date, :date 
  	add_column :events, :end_date, :date 
  	add_column :events, :start_time, :time 
  	add_column :events, :end_time, :time 

  end
end
