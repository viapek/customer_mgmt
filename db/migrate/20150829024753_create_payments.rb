class CreatePayments < ActiveRecord::Migration
  def up
    create_table :payments do |t|
      t.references :customer, index: true, foreign_key: true
      t.datetime 'date'
      t.integer 'amount'
      t.integer 'classes_paid_for'
      t.timestamps null: false
    end
  end
  
  def down
    drop_table 'payments'
  end
end
