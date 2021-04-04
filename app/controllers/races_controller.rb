class RacesController < ApplicationController
 before_action  :redirect_ifnotadmin,  except: [:show]

    def index
         @races = Race.all
    end
    def new
        @race= Race.new
    end
    def create
        @race= Race.new
        @race.name= params[:race][:name]
        @race.date= params[:race][:date]
        @race.miles= params[:race][:miles]
        @race.status = true #by default
        if @race.save
          redirect_to races_path
        else
          redirect_to new_race_path
        end    
    end
    def show
        @race= Race.find(params[:id])
    end
    def edit
        @race= Race.find(params[:id])  
    end 
    def update
        @race= Race.find(params[:id])  
        @race.update( :name => params[:race][:name],
                      :miles => params[:race][:miles],
                      :date => params[:race][:date])
        redirect_to races_path              
    end   
    def updatestatus
        Race.update_status
    end    

end