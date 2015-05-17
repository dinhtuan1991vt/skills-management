class QualificationsDatatable < BaseDatatable
  delegate :edit_qualification_path, to: :@view

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Qualification.count,
      iTotalDisplayRecords: qualifications.total_entries,
      aaData: data
    }
  end

private
  # Map qualifications to data
  def data
    qualifications.map do |qualification|
      from_date = qualification.from_date.strftime("%Y-%m-%d") if !qualification.from_date.nil?
      to_date = qualification.to_date.strftime("%Y-%m-%d") if !qualification.to_date.nil?
      edit_path = link_to(fa_icon('edit lg'), edit_qualification_path(qualification))
      delete_path = link_to(fa_icon('trash-o lg'), qualification, method: :delete, data: { confirm: I18n.t('qualifications.index.delete_confirm')})
      [
        qualification.name,
        qualification.user.full_name,
        qualification.status,
        from_date,
        to_date,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def qualifications
    @qualifications ||= fetch_qualifications
  end

  def fetch_qualifications
    case sort_column
      when "user"
        qualifications = Qualification.joins(:user).order("users.first_name #{sort_direction}")
      else
        qualifications = Qualification.order("#{sort_column} #{sort_direction}")
    end

    qualifications = qualifications.page(page).per_page(per_page)

    if params["search"]["value"].present?
      qualifications = qualifications.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    qualifications
  end

  def sort_column
    columns = %w[name user status from_date to_date]
    super columns
  end
end