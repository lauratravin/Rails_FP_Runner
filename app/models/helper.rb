class Helper
    #find current user if the user logged in before
    def self.current_user(session)
      @current_user ||=  User.find_by_id(session[:user_id]) if session[:user_id]
    end
   
    def self.is_logged_in?(session)
       !!current_user(session)
    end

    def self.is_admin?(session)
          
           @user =  User.find_by_id(session[:user_id])
          
           if @user.admin
               return true     #this will work?    
           else
             return false
          end  
     
    end  
end   