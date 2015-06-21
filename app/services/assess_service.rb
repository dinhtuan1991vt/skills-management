class AssessService < BaseService
  # Save assess
  def save_assess(assess)
    assess.save
  end

  # Update assess
  def update_assess(assess, params)
    assess.update(params)
  end

  # Delete assess
  def destroy_assess(assess)
    assess.destroy
  end

  # Update assess skills
  def update_assess_data(current_user)
    if current_user.has_role? :GeneralStaff
      Skill.find_each do |skill|
        Assess.find_or_create_by supervisor_id: current_user.id, user_id: current_user.id, skill_id: skill.id
      end
      return
    end

    # clean old assesses
    Assess.where(supervisor_id: current_user.id).each do |assess|
      user = User.find(assess.user_id)
      if (user.has_role?(:Supervisor) || user.has_role?(:Admin)) &&
        user.id != current_user.id
        assess.destroy
      end
    end

    # update assess data
    User.find_each do |user|
      if user.has_role?(:GeneralStaff) ||
        (user.id == current_user.id)
        Skill.find_each do |skill|
          Assess.find_or_create_by supervisor_id: current_user.id, user_id: user.id, skill_id: skill.id
        end
      end
    end
  end

end