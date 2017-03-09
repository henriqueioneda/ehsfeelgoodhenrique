class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :user
      t.money :value
      t.string :method
      t.timestamps
    end
  end
end
