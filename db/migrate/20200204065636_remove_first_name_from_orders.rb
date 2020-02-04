class RemoveFirstNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :first_name, :string
  end
end
