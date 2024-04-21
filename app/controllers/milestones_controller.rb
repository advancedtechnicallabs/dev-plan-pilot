class MilestonesController < ApplicationController
  before_action :set_milestone, only: %i[ show edit update destroy ]

  # GET /milestones or /milestones.json
  def index
    project_id = params[:id]
    project_data = Project.find(project_id)
    @milestones = project_data.milestones.rank(:row_order)

  end

  def sort
    @milestone = Milestone.find(params[:id])
    @milestone.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  # GET /milestones/1 or /milestones/1.json
  def show
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
  end

  # GET /milestones/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /milestones or /milestones.json
  def create
    @milestone = Milestone.new(milestone_params)

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to milestone_url(@milestone), notice: "Milestone was successfully created." }
        format.json { render :show, status: :created, location: @milestone }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /milestones/1 or /milestones/1.json
  def update
    
    puts "THIS IS A TEST IN UPDATE."

    puts "milestone 2--->>>>>> #{params[:milestone][:descriptive_name]}"

    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to milestone_url(@milestone), notice: "Milestone was successfully updated." }
        format.json { render :show, status: :ok, location: @milestone }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /milestones/1 or /milestones/1.json
  def destroy
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to milestones_url, notice: "Milestone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def milestone_params
      params.permit(:id, :project_id, :estimated_completion_date, :descriptive_name, :status)
      
    end
end
