class QualificationService < BaseService
  def save_qualification(qualification)
    qualification.save
  end

  def update_qualification(qualification, params)
    qualification.update(params)
  end

  def destroy_qualification(qualification)
    qualification.destroy
  end
end