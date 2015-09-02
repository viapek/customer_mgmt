class CreateAppointmentLogs < ActiveRecord::Migration
  def up
    create_table :appointment_logs do |t|
      t.references :customer, index: true, foreign_key: true
      t.datetime 'date'
      t.boolean 'chargeable', default: true
      t.text 'notes'
      t.timestamps null: false
    end
  end
  
  def down
    drop_table 'appointment_logs'
  end
end
