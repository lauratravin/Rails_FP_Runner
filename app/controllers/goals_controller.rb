class GoalsController < ApplicationController
    before_action  :redirect_ifnotloggedin

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to user_path, alert: "User not found."
          else
           
            @goal = Goal.new(user_id: params[:user_id])
          end
        
    end    

    def create

        @goal = Goal.new(goal_params)
        @goal.save
        if @goal.errors.any?
          render :new
        else    
         redirect_to user_path(@goal.user)
        end

    end    

    private

        def goal_params
            params.require(:goal).permit(:year, :miles, :user_id)
        end

end   