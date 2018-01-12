class ResolutionsController < ApplicationController
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]

  # GET /resolutions
  # GET /resolutions.json
  def index
    @resolutions = Resolution.where(user_id: current_user.id)
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new
  end

  # GET /resolutions/1/edit
  def edit
  end

  def make_complete
    @resolution = Resolution.find(params[:resolution_id].to_i)
    @resolution.state = 2
    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Congratulations on completing your resolution! You wont get reminders for it anymore.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { redirect_to @resolution, notice: 'Oops something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @resolution }
      end
    end
  end

  def make_on_hold
    @resolution = Resolution.find(params[:resolution_id].to_i)
    @resolution.state = 3
    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Your resolution is now on hold, you wont get anymore reminders until its restored.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { redirect_to @resolution, notice: 'Oops something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @resolution }
      end
    end
  end

  def make_active
    @resolution = Resolution.find(params[:resolution_id].to_i)
    @resolution.state = 1
    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Your resolution is now active, expect to get reminders again.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { redirect_to @resolution, notice: 'Oops something went wrong! Please try again' }
        format.json { render :show, status: :ok, location: @resolution }
      end
    end
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Resolution was successfully created.' }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: 'Resolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolution_params
      params.require(:resolution).permit(:name, :mission_statement, :state_id, :user_id, :spam_time, :sun, :mon, :tue, :wed, :thu, :fri, :sat, :cell, :email, goal_ids: [])
    end
end
