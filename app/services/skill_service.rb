class SkillService < BaseService
  # Save skill
  def save_skill(skill)
    skill.save
  end

  # Update skill
  def update_skill(skill, params)
    skill.update(params)
  end

  # Delete skill
  def destroy_skill(skill)
    skill.destroy
  end
end