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
       
         @race= Race.new(race_params)
        # @race= Race.new
        # @race.name= params[:race][:name]
        # @race.date= params[:race][:date]
        # @race.miles= params[:race][:miles]
        # @race.miles= params[:race][:latitud]
        # @race.miles= params[:race][:longitud]
         @race.status = true #by default

        if @race.save
          redirect_to races_path
        else
          flash[:notice] = 'Data not saved.'
          render :new
        end    
    end
    def show
      
        @race= Race.find(params[:id])
        @user= params[:user_id]  #I need the user here just for back button

    end
    def edit
        @race= Race.find(params[:id])  
    end 
    def update
        @race= Race.find(params[:id])  
        # @race.update( :name => params[:race][:name],
        #               :miles => params[:race][:miles],
        #               :date => params[:race][:date],
        #               :latitud => params[:race][:latitud],
        #               :longitud => params[:race][:longitud])
        if  @race.update(race_params)
            redirect_to races_path
        else
            render :edit
        end                     
    end   
    def updatestatus
        Race.update_status
        redirect_to races_path
    end    

    private 
    def race_params
       params.require(:race).permit(:name,:date,:miles,:longitud,:latitud)
    end   



end