class Backend::BaseController < ApplicationController

  # before_action :authenticate_user!
  # before_action :authenticate_admin!
  layout 'backend'
  # before_action :authenticate_user!
  protected
    def update_user_profile_params
      permit_params = [:user_name, :birthday,:gender, :platform,:profile_image, :age, :height, :weight,:level, :life_styles => []]
      params.require(:user).permit permit_params
    end

    def require_admin
      unless  current_user.role?
        redirect_to backend_root_path , alert: 'You dont have permission to access'
      else
        reset_session
      end
    end
end
