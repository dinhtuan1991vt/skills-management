class TeamsDatatable < BaseDatatable
  delegate :edit_team_path, to: :@view

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Team.count,
      iTotalDisplayRecords: teams.total_entries,
      aaData: data
    }
  end

private
  # Map teams to data
  def data
    teams.map do |team|
      edit_path = link_to(fa_icon('edit lg'), edit_team_path(team))
      delete_path = link_to(fa_icon('trash-o lg'), team, method: :delete, data: { confirm: I18n.t('teams.index.delete_confirm') })
      [
        team.name,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def teams
    @teams ||= fetch_teams
  end

  def fetch_teams
    teams = Team.order("#{sort_column} #{sort_direction}")
    teams = teams.page(page).per_page(per_page)

    if params["search"]["value"].present?
      teams = teams.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    teams
  end

  def sort_column
    columns = %w[name]
    super columns
  end
end