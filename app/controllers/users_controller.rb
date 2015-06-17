class UsersController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :load_user_service, only: [:create, :update, :destroy, :update_custom_skill]

  # Show users
  def index
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  # New user
  def new
    @user = User.new
  end

  # Edit user
  def edit
  end

  # Create new user
  def create
    @user = User.new(user_params)
    authorize! :create, @user

    respond_to do |format|
      if @user_service.save_user(@user)
        format.html { redirect_to users_path, notice: I18n.t('users.index.create_notice') }
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  # Update user
  def update
    respond_to do |format|
      if is_custom_skill_set
        format.html { redirect_to custom_skill_user_path(@user)}
      end

      if @user_service.update_user(@user, user_params)
        format.html { redirect_to users_path, notice: I18n.t('users.index.update_notice') }
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  # Delete user
  def destroy
    @user_service.destroy_user(@user)
    respond_to do |format|
      format.html { redirect_to users_path, notice: I18n.t('users.index.destroy_notice') }
    end
  end

  # Custom skill
  def custom_skill
  end

  # Update custom skill
  def update_custom_skill
    respond_to do |format|
      @user.skills.clear
      skill_ids.each {|skill_id| @user.skills << Skill.find(skill_id)}
      format.json { render json: {href: users_path} }
    end
  end

  private
    # Set current user
    def set_user
      @user = User.find(params[:id])
    end

    # Get params
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :sur_name, :location_id, :status, :team_id, :skill_set)
    end

    # Check is next commit
    def is_custom_skill_set
      params[:user][:skill_set].to_i == 3
    end

    # Load service
    def load_user_service
      @user_service = UserService.new
    end

    # Get skill ids
    def skill_ids
      params['arr_ids'].select {|skill_id| @user_service.is_id?(skill_id)}
    end
end