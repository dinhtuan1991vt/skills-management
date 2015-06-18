class UserService < BaseService
  # Save user
  def save_user(user)
    user.save
  end

  # Update user
  def update_user(user, params)
    user.update(params)
  end

  # Delete user
  def destroy_user(user)
    user.destroy
  end

  # Update user skills
  def update_user_skills(user, skill_ids)
    Skill.transaction do
      user.skills.clear
      skill_ids.each {|skill_id| user.skills << Skill.find(skill_id) if is_id?(skill_id) }
    end
  end
end