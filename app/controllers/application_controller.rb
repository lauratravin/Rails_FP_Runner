class ApplicationController < ActionController::Base

#note: everyone can see race list
    def nyrr
        @races = Race.all
    end    

    def redirect_ifnotadmin
        if !User.find(session[:user_id]).admin
           redirect_to root_path 
        end
    end  
    


end
