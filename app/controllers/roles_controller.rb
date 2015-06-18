class RolesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_role, only: [:edit, :update, :destroy]
  before_action :load_role_service, only: [:create, :update, :destroy]

  # Show roles
  def index
    respond_to do |format|
      format.html
      format.json { render json: RolesDatatable.new(view_context) }
    end
  end

  # New role
  def new
    @role = Role.new
  end

  # Edit role
  def edit
  end

  # Create new role
  def create
    @role = Role.new(role_params)
    authorize! :create, @role

    respond_to do |format|
      if @role_service.save_role(@role)
        format.html { redirect_to roles_path, notice: I18n.t('roles.index.create_notice') }
      else
        format.html { render :new }
      end
    end
  end

  # Update role
  def update
    respond_to do |format|
      if @role_service.update_role(@role, role_params)
        format.html { redirect_to roles_path, notice: I18n.t('roles.index.update_notice') }
      else
        format.html { render :edit }
      end
    end
  end

  # Delete role
  def destroy
    @role_service.destroy_role(@role)
    respond_to do |format|
      format.html { redirect_to roles_path, notice: I18n.t('roles.index.destroy_notice') }
    end
  end

  private
    # Set current role
    def set_role
      @role = Role.find(params[:id])
    end

    # Get params
    def role_params
      params.require(:role).permit(:name)
    end

    # Load role service
    def load_role_service
      @role_service = RoleService.new
    end
end