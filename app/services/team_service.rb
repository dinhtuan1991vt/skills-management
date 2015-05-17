class TeamService < BaseService
  # Save team
  def save_team(team)
    team.save
  end

  # Update team
  def update_team(team, params)
    team.update(params)
  end

  # Delete team
  def destroy_team(team)
    team.destroy
  end
end