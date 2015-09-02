class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string 'name', :limit => 50
      t.string 'phone', :limit => 11
      t.string 'email', :limit => 100
      t.boolean 'current'
      t.timestamps null: false
    end
  end
  
  def down
    drop_table 'customers'
  end
end
