class RacesController < ApplicationController
 before_action  :redirect_ifnotadmin,  except: [:show]
#  layout 'admin', :except => :show
layout :choose_layout

        def choose_layout
            if helpers.is_admin?(session)
            'admin'
            end
        end

     
    def index
         @races = Race.all
    end
    def new
        @race= Race.new
    end
    def create
        # @race= Race.new(race_params(:name,:date,:miles,:latitud,:longitud))
        @race= Race.new
        @race.name= params[:race][:name]
        @race.date= params[:race][:date]
        @race.miles= params[:race][:miles]
        @race.miles= params[:race][:latitud]
        @race.miles= params[:race][:longitud]
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
                      :date => params[:race][:date],
                      :latitud => params[:race][:latitud],
                      :longitud => params[:race][:longitud])
        redirect_to races_path              
    end   
    def updatestatus
        Race.update_status
    end    

    private 
    def race_params
       params.require(:race).permit(:name)
    end   



end