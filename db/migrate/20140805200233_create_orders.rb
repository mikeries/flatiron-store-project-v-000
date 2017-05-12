class CreateOrders < ActiveRecord::Migration
  create_table :orders do |t|
  

    t.timestamps null: false
  end
end
