class CreateAbstractOrders < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :abstract_orders, default: Date.current
  end
end
