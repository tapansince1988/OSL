class CityController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in

    def index
        @city = City.all
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new(city_params)
        if(@city.save)
            flash[:notice] = "City created successfully."
            redirect_to(:action => "index")
        else
            render 'new'
        end
    end

    def edit
        @city = City.find(params[:id])
    end

    def update
        @city = City.find(params[:id])
        if @city.update_attributes(city_params)
            flash[:notice] = "City updated Successfully."
            redirect_to(:action => "index")
        else
            render('edit')
        end
    end

    def destroy
        @city = City.find(params[:id])
        @city.destroy
        flash[:notice] = "City deleted Successfully."
        redirect_to(:action => 'index')
    end

    private
    def city_params
        params.require(:city).permit(:name)
    end
end
