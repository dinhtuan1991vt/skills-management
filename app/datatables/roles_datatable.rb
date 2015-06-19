class RolesDatatable < BaseDatatable
  delegate :edit_role_path, :role_path, to: :@view
  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Role.count,
      iTotalDisplayRecords: roles.total_entries,
      aaData: data
    }
  end

private
  # Map roles to data
  def data
    roles.map do |role|
      [
        role.name,
      ]
    end
  end

  def roles
    @roles ||= fetch_roles
  end

  def fetch_roles
    roles = Role.order("#{sort_column} #{sort_direction}")
    roles = roles.page(page).per_page(per_page)

    if params["search"]["value"].present?
      roles = roles.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    roles
  end

  def sort_column
    columns = %w[name]
    super columns
  end
end