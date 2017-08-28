class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :destroy]

  # GET /stories
  def index
    @stories = Story.order('created_at DESC').paginate(page: params[:page], per_page: 20)
    # To allow adding a new story
    @story = Story.new
    @story.user_id = current_user.id
  end

  # GET /stories/1
  def show
    @story = Story.find(params[:id])
  end

  # POST /stories
  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if @story.save
      flash[:info] = "Post submitted successfully"
      redirect_to stories_url
    else
      @stories = Story.order('created_at DESC').paginate(page: params[:page], per_page: 20)
      render :index
    end
  end

  # DELETE /stories/1
  def destroy
    @story = Story.find(params[:id])
    user = @story.user
    # Confirms admin or correct user
    redirect_to(stories_url) unless (current_user.admin? || current_user?(user))
    Story.find(params[:id]).destroy
    flash[:success] = "Story deleted"
    redirect_to stories_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:content)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
