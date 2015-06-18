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

  # Update user skills
  def update_team_skills(team, skill_ids)
    Skill.transaction do
      team.skills.clear
      skill_ids.each {|skill_id| team.skills << Skill.find(skill_id) if is_id?(skill_id)}
    end
  end
end