class RegistrationsController < ApplicationController
      def index
        if params[:user_id]
            @registrations = User.find(params[:user_id]).registrations
        else
            @registrations = Registration.all
        end        
      end  

      def show
      end  


      def create
        binding.pry
      end  
         

      def destroy
          @registration = Registration.find(params[:id])
          @registration.destroy

      end 

end
