class AdminController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

    def index
        @usr_name = AdminUser.find(session[:user_id])
    end

    def login
        render 'login', layout: 'application'
    end

    def attempt_login
        if params[:email].present? && params[:password].present?
            found_user =  AdminUser.where(:email => params[:email]).first
            if found_user
                @usr_name = found_user
                authorized_user = found_user.authenticate(params[:password])
            end
        end
        if authorized_user
            session[:user_id] = authorized_user.id
            session[:user_name] = authorized_user.name
            redirect_to(:action => 'index', :id => @usr_name.id)
        else
            flash[:notice] = "Invalid username/password combination."
            redirect_to(:action => 'login')
        end
    end

    def logout
        session[:user_id] = nil
        session[:user_name] = nil
        redirect_to(:action => 'login')
    end

    private
    def usr_params
        params.require(:admin_user).permit(:name, :email, :password)
    end


end
