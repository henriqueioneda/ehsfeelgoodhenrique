class User < ApplicationRecord
  has_many :payments
  enum acc_types: [:client, :integrator, :supplier]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  self.acc_types.each_key do |acc_type|
    define_method("#{acc_type}?") do
      self.acc_type == self.class.acc_types[acc_type.to_sym]
    end
  end

  def payments
    Payment.where(payer_id: self.id).or(Payment.where(payee_id: self.id))
  end
end
