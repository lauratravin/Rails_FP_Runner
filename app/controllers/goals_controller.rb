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
        @user = User.find(goal_params[:user_id])
        
        if !Goal.exist_duplicate?(goal_params[:year], @user)
             @goal.save
            
            if @goal.errors.any?
              render :new
            else    
             
               redirect_to user_path(@goal.user)
            end

        else

          flash[:notice] = 'This year has a goal, try another year.'
          render :new
          end
    end    

    private

        def goal_params
            params.require(:goal).permit(:year, :miles, :user_id)
        end

end   