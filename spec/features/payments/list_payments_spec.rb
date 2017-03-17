include Warden::Test::Helpers
Warden.test_mode!

feature 'Payment list' do

  before(:each) do 
    @user_with_payment = create :user, :with_payment_as_payer 
    @user_without_payment = create :user
  end

  scenario 'user has no payments' do
    login_as(@user_without_payment, :scope => :user)
    visit payments_path
    expect(page).to have_content("Você ainda não possui pagamentos")
  end

  scenario 'user has payments' do
    login_as(@user_with_payment, :scope => :user)
    visit payments_path
    expect(page).to have_content("Valor")
    expect(page).to have_button("Fatura")
  end

end
