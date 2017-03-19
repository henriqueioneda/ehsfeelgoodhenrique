class User < ApplicationRecord
  has_many :payments
  enum acc_types: [:client, :integrator, :supplier]

  COMPANY_ID = 1
  CPU_USAGE_MULTIPLIER = 0.1
  PAYER_USAGE_MULTIPLIER = 1
  PAYEE_USAGE_MULTIPLIER = 5
  PRICE_MULTIPLIER = 2

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  self.acc_types.each_key do |acc_type|
    define_method("#{acc_type}?") do
      self.acc_type == self.class.acc_types[acc_type.to_sym]
    end
  end

  def self.company
    User.find(COMPANY_ID)
  end

  def payments
    Payment.where(payer_id: self.id).or(Payment.where(payee_id: self.id))
  end

  def to_s
    self.name
  end

  def charge_for_use
    (self.cpu_usage * CPU_USAGE_MULTIPLIER 
    + Payment.recent.where(payer: self).count * PAYER_USAGE_MULTIPLIER 
    + Payment.recent.where(payee: self).count * PAYEE_USAGE_MULTIPLIER) * PRICE_MULTIPLIER
  end

  def reset_charges
    self.cpu_usage = 0
    save
  end
end
