class MilestonesController < ApplicationController
  before_action :set_milestone, only: %i[ show edit update destroy ]

  # GET /milestones or /milestones.json
  def index
    @project_id = params[:id]

    project_data = Project.find(@project_id)
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
    @milestone.descriptive_name = "Untitled Sprint/Milestone"
    @milestone.project_id = params[:proj_id]
    @milestone.row_order = params[:rank_order].to_i + 1
    @milestone.save

    @element_dom = params[:obj_model_id]

    respond_to do |format|
      format.html
      format.js
    end  

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

    respond_to do |format|

      if params[:commit] == "Update"
        @milestone.descriptive_name = params[:milestone][:descriptive_name]
        @milestone.estimated_start_date = params[:milestone][:estimated_start_date]
        @milestone.estimated_completion_date = params[:milestone][:estimated_completion_date]

        if @milestone.update(@milestones.to_h)
          format.js
        end

      else

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
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end


end
