class TeamService < BaseService
  def save_team(team)
    team.save
  end

  def update_team(team, params)
    team.update(params)
  end

  def destroy_team(team)
    team.destroy
  end
end