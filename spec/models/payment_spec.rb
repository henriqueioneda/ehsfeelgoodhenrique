describe Payment do
  let(:user) { double("User") }

  before(:each) do
    @payment = create :payment, :with_spents
  end

  subject { @payment }

  it { should respond_to(:paid?, :spents, :paid_at, :due_date) }

  it "#total_spents returns the sum of all spents" do
    expect(@payment.total_spents).to eq 2100.00
  end

  it "#pay marks payment as paid" do
    allow(User).to receive(:company).and_return(@payment.payee.id)
    @payment.pay
    expect(@payment).to be_paid
  end
end
