class UsersController < ApplicationController
  before_action  :redirect_ifnotloggedin,  except: [:new]

  def new
  end

  

  def create
        @user =  User.new
     
        @user.name= params[:name]
        @user.email= params[:email]
        @user.dob= params[:dob]
        @user.pace= params[:pace]
    
      
        if   @user.save
        @user.generatememberid
        redirect_to login_path
        else 
            render :new 
        end 
  end

  def show
    @user = User.find_by_id(params[:id])
    @available_races = @user.find_available_races
  end 


  def edit
        @user = User.find(params[:id])
       
  end   
  def update
            @user = User.find(params[:id])
            @user.update(:name => params[:user][:name],
                :email => params[:user][:email],
                :dob => params[:user][:dob],
                :email => params[:user][:email],
                :pace => params[:user][:pace])
            redirect_to user_path(@user)
  end 
  
  
  
end