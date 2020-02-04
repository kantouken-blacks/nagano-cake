class RemovePostCodeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :post_code, :string
  end
end
