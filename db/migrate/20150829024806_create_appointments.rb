class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer 'day'
      t.time 'start_time'
      t.time 'finish_time'
      t.string 'location'
      t.timestamps null: false
    end
  end
  
  def down
    drop_table 'appointments'
  end
end
