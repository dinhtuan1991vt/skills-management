class UsersDatatable < BaseDatatable
  delegate :edit_user_path, to: :@view
  # Get result
  def as_json(options = {})
    {
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

private
  # Map users to data
  def data
    users.map do |user|
    team_name = user.team.name if !user.team.nil?
    location_name = user.location.name if !user.location.nil?
    edit_path = link_to(fa_icon('edit lg'), edit_user_path(user))
    delete_path = link_to(fa_icon('trash-o lg'), user, method: :delete, data: { confirm: I18n.t('users.index.delete_confirm') })
      [
        user.email,
        user.full_name,
        team_name,
        location_name,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    case sort_column
      when "full_name"
        users = User.order("first_name #{sort_direction}")
      when "team_name"
        users = User.joins(:team).order("teams.name #{sort_direction}")
      when "location_name"
        users = User.joins(:location).order("locations.name #{sort_direction}")
      else
        users = User.order("#{sort_column} #{sort_direction}")
    end

    users = users.page(page).per_page(per_page)

    if params["search"]["value"].present?
      users = users.where("first_name like :search or email like :search or sur_name like :search", search: "%#{params["search"]["value"]}%")
    end
    users
  end

  def sort_column
    columns = %w[email full_name team_name location_name]
    super columns
  end
end