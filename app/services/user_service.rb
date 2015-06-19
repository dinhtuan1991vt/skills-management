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

  # Set user role
  def set_role(user, role)
      # About role of rolify gem:
      # user has one or many roles
      # user can be Admin role apply for any resources or all of resources
      # in roles table, if resources empty, that's mean user have that role apply for all of resources
      # So, this code will add role for all of resource. Advanced function will be developed in the future
      # TO DO:
      #   1. Reject old role from all of resources
      user.roles.clear
      #   2. Apply this role to all of resources
      user.add_role role
  end

end