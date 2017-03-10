class ChangePaymentFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :user_id, :integer
    add_column :payments, :payer_id, :integer
    add_column :payments, :payee_id, :integer
    add_column :payments, :paid, :boolean
  end
end
