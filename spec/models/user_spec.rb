describe User do

  before(:each) do
    @user = User.new(email: 'user@example.com', name: "John Doe") 
    @client = create(:user, :client, cc_number: "1234")
    @integrator = create(:user, :integrator, cpf_cnpj: "123.123.123-4")
    @supplier = create(:user, :supplier, bank_account: "1234-5")
  end

  subject { @user }

  it { should respond_to(:email, :name) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "#name returns a string" do
    expect(@user.name).to match 'John Doe'
  end

  subject { @client }

  it "#acc_type returns account type" do
    expect(@client.acc_type).to match User.acc_types[:client]
  end

  it "#cc_number returns credit card number as string" do
    expect(@client.cc_number).to match '1234'
  end

  subject { @integrator }
  
  it "#acc_type returns account type" do
    expect(@integrator.acc_type).to match User.acc_types[:integrator]
  end

  it "#cpf_cnpj returns a string" do
    expect(@integrator.cpf_cnpj).to match '123.123.123-4'
  end
  
  subject { @supplier }
  
  it "#acc_type returns account type" do
    expect(@supplier.acc_type).to match User.acc_types[:supplier]
  end

  it "#bank_account returns a string with the bank account" do
    expect(@supplier.bank_account).to match '1234-5'
  end

end
