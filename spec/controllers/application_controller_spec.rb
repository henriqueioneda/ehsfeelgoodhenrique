require "rails_helper"

RSpec.describe ApplicationController do
    controller do
        def index
            render text: "123"
        end
    end

    before(:each) do 
        @user = FactoryGirl.create(:user)
        sign_in(@user)
    end

    describe 'GET index' do
        it "increments cpu_usage" do
            get :index
            expect(@user.reload.cpu_usage).not_to be_zero
        end
    end
end
