class RoleService < BaseService
  # Save role
  def save_role(role)
    role.save
  end

  # Update role
  def update_role(role, params)
    role.update(params)
  end

  # Delete role
  def destroy_role(role)
    role.destroy
  end
end