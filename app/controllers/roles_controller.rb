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
 end

  # Edit role
  def edit
  end

  # Create new role
  def create
  end

  # Update role
  def update
  end

  # Delete role
  def destroy
  end

end