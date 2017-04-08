class AdminUserController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in

    def index
        @usr = AdminUser.all
    end

    def new
        @usr = AdminUser.new
    end

    def create
        @usr = AdminUser.new(usr_params)
        if @usr.save
            flash[:notice] = "Admin User created Successfully."
            redirect_to(:action => 'index')
        else
            render('new')
        end
    end

    def edit
        @usr = AdminUser.find(params[:id])
    end

    def update
        @usr = AdminUser.find(params[:id])
        if @usr.update_attributes(usr_params)
            flash[:notice] = "User updated Successfully."
            redirect_to(:action => 'index')
        else
            render('edit')
        end
    end

    def delete
        @usr = AdminUser.find(params[:id])
        @usr.destroy
        flash[:notice] = "User deleted Successfully."
        redirect_to(:action => 'index')
    end


    private
    def usr_params
        params.require(:admin_user).permit(:name, :email, :password)
    end
end
