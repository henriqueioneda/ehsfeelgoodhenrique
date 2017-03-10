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
            @user.assign_attributes(params.require(:user).permit(:acc_type, :cc_number, :cc_name, :cc_exp, :cpf_cpnj))
        end
        bypass_sign_in(@user)
        render_wizard @user
    end

    def finish_wizard_steps
        root_path
    end
end 
