class UsersController < ApplicationController
 before_action  :redirect_ifnotloggedin,  except: [:new,:create]
 layout :choose_layout, except: [:new, :create]
  # layout 'admin', except: [:new,:show, :edit]

  def choose_layout
    if helpers.is_admin?(session)
      'admin' 
    end
  end

  def index
    @users= User.all
    if !helpers.is_admin?(session)
      redirect_to root_path
    end  

  end  

  def new
      @newuser =  User.new
      if session["devise.facebook_data"]
        @newuser.name = session[:name]
      end  
  end

  def create
        
        @newuser =  User.new
        if session["devise.facebook_data"]
          @newuser.uid= session["devise.facebook_data"]["uid"]
          @newuser.provider = session["devise.facebook_data"]["provider"]
        end  
        
        @newuser.name= params[:name]
        @newuser.email= params[:email]
        @newuser.dob= params[:dob]
        @newuser.pace= params[:pace]
        @newuser.password= params[:password]
         @newuser.admin = false
       
          # @newuser.valid? #deprecated
        if    @newuser.save   
              @newuser.generatememberid

              redirect_to login_path
        else 
               render :new 
        end 
  end

  def show
    @user = User.find(params[:id])
    if helpers.valid_user?(@user)
      @registered_active_races = @user.find_registered_races   
      @available_races = @user.find_available_races
      @oldraces= @user.find_oldraces
    else
        redirect_to user_path(@user)
    end     

  end 


  def edit
  
        @user = User.find(params[:id])
        if !@user || ( @user != helpers.current_user(session) && !helpers.is_admin?(session) )
              redirect_to root_path
        end    
       
  end   
  def update
            @user = User.find(params[:id])
           
            @user.update(:name => params[:user][:name],
                :email => params[:user][:email],
                :dob => params[:user][:dob],
                :email => params[:user][:email],
                :pace => params[:user][:pace])

           if @user.valid?

            if helpers.is_admin?(session)
              redirect_to admin_path
            else   
              redirect_to user_path(@user)
            end
          
          else
            render :edit
          end  
  end 
 
  
end