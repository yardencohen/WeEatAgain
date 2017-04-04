class RemoveMaxDeliveryTimeFromResturants < ActiveRecord::Migration[5.0]
  def change
    remove_column :resturants, :max_delivery_time, :time
  end
end
