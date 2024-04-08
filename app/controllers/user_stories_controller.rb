class UserStoriesController < ApplicationController
  before_action :set_user_story, only: %i[ show edit update destroy ]

  # GET /user_stories or /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  # GET /user_stories/1 or /user_stories/1.json
  def show
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
  end

  # GET /user_stories/1/edit
  def edit
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
      if @user_story.update(user_story_params)
        format.html { redirect_to user_story_url(@user_story), notice: "User story was successfully updated." }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1 or /user_stories/1.json
  def destroy
    @user_story.destroy

    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: "User story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_story_params
      params.require(:user_story).permit(:milestone_id, :descriptive_name, :membership_id, :project_id, :estimated_completion_date)
    end
end
