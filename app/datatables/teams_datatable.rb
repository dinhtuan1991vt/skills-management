class TeamsDatatable < BaseDatatable
  delegate :edit_team_path, to: :@view

  def as_json(options = {})
    {
      iTotalRecords: Team.count,
      iTotalDisplayRecords: teams.total_entries,
      aaData: data
    }
  end

private
  def data
    teams.map do |team|
      [
        team.name,
        link_to(fa_icon('edit lg'), edit_team_path(team)) + " " + link_to(fa_icon('trash-o lg'), team, method: :delete, data: { confirm: I18n.t('teams.index.delete_confirm') })
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