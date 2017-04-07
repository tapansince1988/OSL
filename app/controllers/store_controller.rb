class StoreController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in

    def index
        @store = Store.all
    end

    def show
        @store = Store.find(params[:id])
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        if(@store.save)
            flash[:notice] = "Store created successfully."
            redirect_to(:action => "index")
        else
            render 'new'
        end
    end

    def edit
        @store = Store.find(params[:id])
    end

    def update
        @store = Store.find(params[:id])
        if @store.update_attributes(store_params)
            flash[:notice] = "Store updated Successfully."
            redirect_to(:action => 'show', :id => @store.id)
        else
            render('edit')
        end
    end

    def delete
        @store = Store.find(params[:id])
    end

    def destroy
        @store = Store.find(params[:id])
        @store.destroy
        flash[:notice] = "Store deleted Successfully."
        redirect_to(:action => 'index')
    end

    def store_params
        params.require(:store).permit(:name, :address, :pin, :phone, :website, :tags, :city_id)
    end
end
