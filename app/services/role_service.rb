class RoleService < BaseService
  def save_role(role)
    role.save
  end

  def update_role(role, params)
    role.update(params)
  end

  def destroy_role(role)
    role.destroy
  end
end