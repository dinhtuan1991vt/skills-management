class SkillService < BaseService
  def save_skill(skill)
    skill.save
  end

  def update_skill(skill, params)
    skill.update(params)
  end

  def destroy_skill(skill)
    skill.destroy
  end
end