class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

        helper_method :current_user, :check_current_user, :profile, :check_profile, :check_current_profile

        def current_user
            current_user ||= User.where("id = ? and activation_status = ?", session[:user], 'active').first
        end

        def check_profile
            check_profile ||= Profile.where("user_id = ?", session[:user]).first
        end

        def check_current_profile
            if check_profile.blank?
                redirect_to '/dashboard/profiles/new'
            else
                check_profile
            end
        end

        def check_current_user
            if current_user.blank?
                flash[:error] = "plase login first before run the action"
                redirect_to '/forbidden/'
            else
                  current_user
            end
        end

        def profile

                @profile = Profile.find_by_id(1)
        end


end
