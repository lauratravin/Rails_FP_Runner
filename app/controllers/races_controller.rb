class RacesController < ApplicationController
 before_action  :redirect_ifnotadmin 

    def index
         @races = Race.all
    end
    def new
    end
    def create
        @race= Race.new
        @race.name= params[:name]
        @race.date= params[:dates]
        @race.miles= params[:miles]
        @race.status = true #by default

        redirect_to races_path
    end
    def show
        @race= Race.find(params[:id])
    end
    def edit
    end 
    def update
    end                

end