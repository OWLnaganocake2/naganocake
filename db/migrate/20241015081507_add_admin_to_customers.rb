class AddAdminToCustomers < ActiveRecord::Migration[6.1]
  def change
     add_column :Customers, :admin, :boolean, default: false
  end
end
