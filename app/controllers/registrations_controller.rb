class RegistrationsController < ApplicationController
  before_action  :redirect_ifnotloggedin


      def index
        if params[:user_id]
            @registrations = User.find(params[:user_id]).registrations
        else
            @registrations = Registration.all
        end        
      end  
     
      # def new
      #   @registration = Registration.new(:user_id => params[:user_id])
      # end  
      def show
       
          @registration = Registration.find(params[:id])
          @user= User.find(params[:user_id])
          @race= @registration.race
      end  


      def create
       

        @user = User.find(params[:user_id])
        @race = Race.find(params[:race])
        @registration = Registration.new
        @registration.user = @user
        @registration.race= @race
        @registration.estimated = @user.cal_estimated_time(@race.miles)
        if @registration.save
          redirect_to user_registration_path(@user, @registration)
        else
          redirect_to user_path(@user)
        end   
      end  
         

      def destroy
          @user= params[:user_id]
          @registration = Registration.find(params[:id])
          @registration.destroy
          redirect_to user_path(@user)

      end 

end
