class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit,  :update]
  before_action :admin_user,     only: :destroy

  # GET /users
  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 20)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  # GET /users/new
  def new
    if logged_in?
      flash[:info] = "You are already signed in!"
      redirect_to stories_url
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.profile_pic_path = User.find_google_images(@user.name)
    if params[:user][:secret_pass] != ENV['SECRET_PASS']
      @user.errors.add(:secret_pass, "is incorrect!")
      render 'new'
    elsif @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
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
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
