class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      
      t.integer :amount
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :item_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
