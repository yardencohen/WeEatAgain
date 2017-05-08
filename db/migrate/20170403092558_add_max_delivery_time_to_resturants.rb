class AddMaxDeliveryTimeToResturants < ActiveRecord::Migration[5.0]
  def change
    add_column :resturants, :max_delivery_time, :integer
  end
end
