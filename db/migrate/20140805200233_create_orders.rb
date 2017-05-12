class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
<<<<<<< HEAD
=======


>>>>>>> 86014427dfd82b7f8d3138df731c5097b10a92d5
      t.timestamps null: false
    end
  end
end
