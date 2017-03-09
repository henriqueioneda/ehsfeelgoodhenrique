class User < ApplicationRecord
  has_many :payments
  enum acc_types: [:client, :integrator, :supplier]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acc_types.each do |acc_type|
    define_method("#{acc_type}?") do
      self.acc_type == acc_types[acc_type.to_sym]
    end
  end

end
