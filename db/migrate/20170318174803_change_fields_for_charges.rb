class ChangeFieldsForCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cpu_usage, :integer, default: 0
    change_column :payments, :paid, :boolean, default: false
  end
end
