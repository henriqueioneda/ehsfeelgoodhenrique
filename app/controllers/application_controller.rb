class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :start_charging
  after_action :stop_charging

  protected

  def start_charging
    @start_time = Time.now
  end
  
  def stop_charging
    current_user.cpu_time += (Time.now - @start_time).in_milliseconds.to_i
    current_user.save
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name,
      :type,
      :address,
      :phone,
      :cpf_cnpj,
      :cc_number,
      :cc_name,
      :cc_exp,
      :bank_account,
      :bank_agency
    ])
  end

end
