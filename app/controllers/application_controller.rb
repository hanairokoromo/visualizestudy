class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate!, except: [:top]
    
    def authenticate!
      if admin_signed_in?
        authenticate_admin!
      else
        authenticate_user!
      end
    end
    
  def after_sign_in_path_for(resource)
      if user_signed_in?
          user_path(resource)
      else admin_signed_in?
          admin_root_path
      end
  end
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :account_name])
  end
end
