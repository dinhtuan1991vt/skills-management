class RolesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_role, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: RolesDatatable.new(view_context) }
    end
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    authorize! :create, @role

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: 'Role was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: 'Role was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_path, notice: 'Role was successfully deleted.' }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name)
    end
end