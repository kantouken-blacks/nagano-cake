class RemoveLastNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :last_name, :string
  end
end
