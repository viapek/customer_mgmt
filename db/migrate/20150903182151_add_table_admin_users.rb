class AddTableAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.integer "customer_id"
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :limit => 100, null: false
      t.string "password_digest"
      t.timestamps     
    end
    add_index(:admin_users, "customer_id")
    add_index(:admin_users, "email")
  end
  
  def down
    drop_table :admin_users
  end
end
