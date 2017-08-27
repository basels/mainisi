class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /stories
  def index
    @stories = Story.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end

  # GET /stories/1
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Story.new
    @story.user_id = current_user.id
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if @story.save
      flash[:info] = "Post submitted successfully"
      redirect_to stories_url
    else
      render :new
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @story.update_attributes(story_params)
      flash[:success] = "Post updated successfully"
      redirect_to stories_url
    else
      render :edit
    end
  end

  # DELETE /stories/1
  def destroy
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

    # Confirms the correct user.
    def correct_user
      @story = Story.find(params[:id])
      user = @story.user
      redirect_to(stories_url) unless current_user?(user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(stories_url) unless current_user.admin?
    end
end
