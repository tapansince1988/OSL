class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private
    def confirm_logged_in
        unless session[:user_id]
            redirect_to(:controller => 'admin', :action => 'login')
            return false
        else
            return true
        end
    end

end
