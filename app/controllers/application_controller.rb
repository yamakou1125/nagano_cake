class ApplicationController < ActionController::Base

def after_sign_out_path_for(resource)
    new_admin_session_path
end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :telephone_number])
  end

end
