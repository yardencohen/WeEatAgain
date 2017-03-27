class ChangeMaxDeliveryTime < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
  		change_table :resturants do |t|
  			dir.up { t.change :max_delivery_time, :time}
  			dir.down { t.change :max_delivery_time, :datetime}
  		end
  	end
  end
end
