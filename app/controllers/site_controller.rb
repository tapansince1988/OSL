class SiteController < ApplicationController

    layout 'site'

    def index
        # @site = Store.all
        if !params[:search].nil?
            @site = Store.search(params[:search])
            if @site.blank?
                @site = Store.joins(:city).where('cities.name LIKE ?', "%#{params[:search]}%")
            end
        else
            @site = Store.all
        end
    end

    def show
        @site = Store.find(params[:id])
    end

end
