class UsersController < ApplicationController

  def new
       @user =  User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end 


  def create
        @user =  User.new
        @user.name= params[:user][:name]
        @user.email= params[:user][:email]
        @user.dob= params[:user][:dob]
        @user.pace= params[:user][:pace]
        @user.password= params[:user][:password]
        
        if   @user.save
        redirect_to login_path
        else 
            render :new 
        end 
  end
  def edit
        @user = User.find(params[:id])
        @user.update(:name => params[:name-0],
                    :email => params[:email],
                    :dob => params[:dob],
                    :email => params[:email],
                    :pace => params[:pace],
                    :password => params[:password])
        redirect_to root_path
  end   

  
  
  
end