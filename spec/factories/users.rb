FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "please123"
    trait :client do
      acc_type 0
      cpf_cnpj "123.123.123-9"
      cc_number "1234 1234 1234 1234"
      cc_name "Test User Dad"
      cc_exp "12/22"
      address "Billing Avenue"
      phone "+55 (11) 91234-1234"
    end
    trait :integrator do
      acc_type 1
    end
    trait :supplier do
      acc_type 2
      bank_account "1234-5"
      bank_agency "1234-6"
    end
    trait :with_payment_as_payer do
      after(:create) do |user, evaluator|
        create :payment, :with_spents, payer: user
      end
    end
  end
end
