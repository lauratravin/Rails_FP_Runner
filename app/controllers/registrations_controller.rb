class RegistrationsController < ApplicationController
  before_action  :redirect_ifnotloggedin
  before_action  :redirect_ifnotadmin,  except: [:show, :create, :destroy]

  layout :choose_layout

    def choose_layout
        if helpers.is_admin?(session)
        'admin'
        end
    end

      # def index
      #   if params[:user_id]
      #       @registrations = User.find(params[:user_id]).registrations
      #   else
      #       @registrations = Registration.all
      #   end        
      # end  
     
    
      def show
       
          @registration = Registration.find(params[:id])
          @user= User.find(params[:user_id])
          @race= @registration.race
      end  


      def create
       
        @user = User.find(params[:user_id])
        @race = Race.find(params[:race])
        if @user && @race && helpers.valid_user?(@user)
            @registration = Registration.new
            @registration.user = @user
            @registration.race= @race
            @registration.estimated = @user.cal_estimated_time(@race.miles)
            if @registration.save
              redirect_to user_registration_path(@user, @registration)
            else
              redirect_to user_path(@user)
            end   
        else   
          edirect_to user_path(@user)
        end 
      end  
         
      def edit
       
           if user = User.find_by(id: params[:user_id])    
           @registration =  user.registrations.find_by(id: params[:id])
           end
      end
      def update
           @registration = Registration.find(params[:id])
           if @registration
            
              @registration.update(:result => params[:result])
              redirect_to user_path(@registration.user_id)
           else
              redirect_to edit_user_registration_path(@registration.user_id,@registration) 
           end  
    
          
      end    

      def destroy
          @user= User.find_by_id(params[:user_id])
          if helpers.valid_user?(@user)
            @registration = Registration.find(params[:id])
            @registration.destroy
          end  
            redirect_to user_path(@user)

      end 

     

end
