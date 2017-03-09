class AfterSignupController < ApplicationController
    before_action :authenticate_user!
    include ::Wicked::Wizard
    
    steps :select_account_type, :fill_extra_information

    def show
        @user = current_user
        render_wizard
    end

    def update
        @user = current_user
        if params[:user]
            @user.update_attributes(params.require(:user).permit(:acc_type))
        end
        sign_in(@user, bypass: true)
        render_wizard
    end

    def finish_wizard_steps
        root_path
    end
end 
