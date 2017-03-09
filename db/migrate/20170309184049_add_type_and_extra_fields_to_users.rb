class AddTypeAndExtraFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :acc_type, :integer, default: 0
      add_column :users, :cpf_cnpj, :string
      add_column :users, :cc_number, :string
      add_column :users, :cc_name, :string
      add_column :users, :cc_exp, :string
      add_column :users, :bank_account, :string
      add_column :users, :bank_agency, :string
  end
end
