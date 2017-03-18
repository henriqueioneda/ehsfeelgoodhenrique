require 'rails_helper'

RSpec.describe ApplyChargesJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later(123) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'executes perform' do
    payer = create :user, :client, :with_cpu_usage
    payee = create :user, :integrator

    expect(payer.payments).to be_empty

    user_class = class_double("User").as_stubbed_const(transfer_nested_constants: true)

    expect(user_class).to receive(:company)
    allow(User).to receive(:all).and_return([payer])
    allow(User).to receive(:company).and_return(payee)

    ApplyChargesJob.perform_later()
    perform_enqueued_jobs { job }

    expect(payer.payments).not_to be_empty
    payment = Payment.first
    expect(payment.value).to eq 2000
    expect(payment.spents).to match([{ name: "Serviços EHSFeelGood", value: 2000}])
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
