include Warden::Test::Helpers
Warden.test_mode!

feature 'Payment invoice' do

  before(:each) do 
    @user_with_payment = create :user, :with_payment_as_payer
  end

  scenario 'user can see invoice' do
    login_as(@user_with_payment, :scope => :user)
    visit payments_path
    click_button "Fatura"
    expect(page).to have_content("Vencimento")
    expect(page).not_to have_content("Pendente")
    expect(page).to have_content("Total")
    expect(page).to have_button("Gerar PDF")
  end

end
