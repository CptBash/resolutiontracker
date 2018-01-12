class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.select{|goal| goal.resolution.user_id == current_user.id}
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  def make_complete
    @goal = Goal.find(params[:goal_id].to_i)
    @goal.state = 2
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Congratulations on completing your goal! Its been removed from your reminders.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { redirect_to @goal, notice: 'Oops, something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @goal }
      end
    end
  end

  def make_on_hold
    @goal = Goal.find(params[:goal_id].to_i)
    @goal.state = 3
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Your goal is now on hold, you wont see it in your reminders until its restored.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { redirect_to @goal, notice: 'Oops, something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @goal }
      end
    end
  end

  def make_active
    @goal = Goal.find(params[:goal_id].to_i)
    @goal.state = 1
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Your goal is now active, expect it to show up in your reminders again.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { redirect_to @goal, notice: 'Oops, something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @goal }
      end
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :resolution_id, :state)
    end
end
