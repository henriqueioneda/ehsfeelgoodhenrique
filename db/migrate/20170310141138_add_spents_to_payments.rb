class AddSpentsToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :spents, :text
  end
end
