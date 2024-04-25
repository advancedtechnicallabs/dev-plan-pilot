class UserStoriesController < ApplicationController
  before_action :set_user_story, only: %i[ show edit update destroy ]

  # GET /user_stories or /user_stories.json

  def update_cost(id)

    milestone_rec = Milestone.find(@user_story.milestone_id)
    found_project_id = milestone_rec.project_id

    list_of_milestones = Milestone.where(project_id: found_project_id)

    total_project_cost = 0
    
    list_of_milestones.each do |milestone_rec|

        milestone_rec.milestone_cost = 0.00

        associated_user_stories = UserStory.where(milestone_id: milestone_rec.id)
        
        cost = 0
        num_hours = 0
        associated_user_stories.each do |user_story_rec|
          membership_rec = Membership.find(user_story_rec.membership_id)
          user_rec = User.find(membership_rec.user_id)

          user_price = user_rec.price_per_hour
          num_hours = ((milestone_rec.estimated_completion_date - milestone_rec.estimated_start_date).to_i)*8

          cost = cost + user_price 

        end # Of inner loop.
        
      cost_with_hours = cost*num_hours
      milestone_rec.update(milestone_cost: cost_with_hours)  
      
      total_project_cost = total_project_cost + cost_with_hours

      project_rec = Project.find(found_project_id)

      project_rec.update(budget_amount_used: total_project_cost)

      project_status = "Good"
      
      percentage_budget_used = (project_rec.budget_amount_used / project_rec.budget_amount) * 100

      if percentage_budget_used >= 50.0 && percentage_budget_used < 75.0
        project_status = "OK"
      
      elsif percentage_budget_used >= 75.0
        project_status = "At Risk"

      end
      puts "project_status ->>>> #{project_status}"

      project_rec.update(status: project_status)

      
    end

  end


  def index
    @user_stories = UserStory.all
  end


  def sort
    @user_story = UserStory.find(params[:id])
    @user_story.update(row_order_position: params[:row_order_position], milestone_id: params[:milestone_id])
    head :no_content

    self.update_cost(@user_story.milestone_id)

  
  end

  # GET /user_stories/1 or /user_stories/1.json
  def show
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
    @user_story.descriptive_name = "Untitled User Story/Task"
    @user_story.project_id = 1
    @user_story.row_order = params[:rank_order].to_i + 1
    @user_story.membership_id = params[:membership_no].to_i
    @user_story.milestone_id = params[:milestone_no]
    @user_story.save

    @element_dom = params[:obj_model_id]

    self.update_cost(@user_story.milestone_id)

    respond_to do |format|
      format.html
      format.js
    end  

  end

  # GET /user_stories/1/edit
  def edit

    respond_to do |format|
      format.html
      format.js
    end

  end

  # POST /user_stories or /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)

    respond_to do |format|
      if @user_story.save
        format.html { redirect_to user_story_url(@user_story), notice: "User story was successfully created." }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1 or /user_stories/1.json
  def update
    respond_to do |format|

      if params[:commit] == "Update"
        @user_story.descriptive_name = params[:user_story][:descriptive_name]

        user_selection_map = params[:user]

        parsed_user_selection = JSON.parse(user_selection_map.to_json)

        matching_milestone = Milestone.find(@user_story.milestone_id)

        selected_user_id = parsed_user_selection["user_id"].to_i

        proj_id = matching_milestone.project_id

        user_membership_id = Membership.where({project_id: proj_id, user_id: selected_user_id}).first

        @user_story.membership_id = user_membership_id.id

        if @user_story.update(@user_stories.to_h)
          format.js
        end

      else

        format.js

      end
    
    end
    
  end

  # DELETE /user_stories/1 or /user_stories/1.json
  def destroy
    @user_story.destroy

    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: "User story was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
#    def user_story_params
#      params.require(:user_story).permit(:milestone_id, :descriptive_name, :membership_id, :project_id, :estimated_completion_date)
#    end
end
