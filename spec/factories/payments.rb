FactoryGirl.define do
  factory :payment do
    association :payee, factory: [:user, :integrator]
    association :payer, factory: [:user, :client]
    value "12300"
    trait :with_spents do
      spents [
        { name: "Spent 1", value: 100.00 },
        { name: "Spent 2", value: 200.00 },
        { name: "Spent 3", value: 300.00 },
        { name: "Spent 4", value: 400.00 },
        { name: "Spent 5", value: 500.00 },
        { name: "Spent 6", value: 600.00 }
      ]
    end
  end
end
