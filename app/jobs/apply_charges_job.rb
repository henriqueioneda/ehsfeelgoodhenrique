class ApplyChargesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      payment = Payment.new
      payment.value = (user.charge_for_use * 100).to_i
      payment.payer = user
      payment.payee = User.company
      payment.spents = [{ name: "Serviços EHSFeelGood", value: (user.charge_for_use * 100).to_i}]
      payment.save
    end
    # ApplyChargesJob.set(wait: 1.month).perform_later
  end
end
