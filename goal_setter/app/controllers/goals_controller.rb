class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end
  
  def show
    @goal = Goal.find_by(id:params[:id])
  end
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def create
    @goal = Goal.new(goal_params)
    
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
    
  end
  
  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end
  
  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
     if @goal.destroy
       redirect_to goals_url
     else
       flash.now[:errors] = @goal.errors.full_messages
     end
  end
  
  def goal_params
    params.require(:goals).permit(:body,:public,:completed,:title)
  end
end