class UsersController < ApplicationController


  def new
  end

  

  def create
        @user =  User.new
        @user.name= params[:name]
        @user.email= params[:email]
        @user.dob= params[:dob]
        @user.pace= params[:pace]
        @user.password= params[:password]
        binding.pry
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
            @user.update(:name => params[:name-0],
                :email => params[:email],
                :dob => params[:dob],
                :email => params[:email],
                :pace => params[:pace],
                :password => params[:password])
            redirect_to root_path
  end 
  
  
  
end