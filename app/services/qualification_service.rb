class QualificationService < BaseService
  # Save qualification
  def save_qualification(qualification)
    qualification.save
  end

  # Update qualification
  def update_qualification(qualification, params)
    qualification.update(params)
  end

  # Delete qualification
  def destroy_qualification(qualification)
    qualification.destroy
  end

  # Get list of users can be add qualification
  def get_users_can_be_add_qualification(current_user)
    if current_user.has_role? :Admin
      User.all
    else
      User.where(id: current_user.id)
    end
  end
end