class SessionsController < ApplicationController

    def new
    end    

    def create
                user= User.find_by(:email => params[:email])
                if user && user.authenticate(params[:password])
                    session[:user_id] = user.id
                    if !user.admin
                     redirect_to user_path(user)
                    else
                      
                    redirect_to admin_path  
                    end     
                else 
                    render 'sessions/new' 
                end  
       
    end




     def destroy
        # reset_session #deprecated
        session.delete(:user_id)  #https://3rd-edition.railstutorial.org/book/log_in_log_out
        redirect_to root_path

     end    
end