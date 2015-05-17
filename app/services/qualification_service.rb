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
end