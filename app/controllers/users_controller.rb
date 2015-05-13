class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order("id desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :sur_name, :location_id, :status)
    end
end