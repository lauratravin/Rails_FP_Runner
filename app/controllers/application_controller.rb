class ApplicationController < ActionController::Base

#note: everyone can see race list
    def nyrr
        @activeraces = Race.activeraces
        @races= Race.inactiveraces
    end    



 #redirections   

    def redirect_ifnotadmin
        if !User.find(session[:user_id]).admin
           redirect_to root_path 
        end
    end  

    def redirect_ifnotloggedin
        if !helpers.is_logged_in?(session)
           redirect_to login_path 
        end
    end  
    


end
