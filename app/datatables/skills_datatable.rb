class SkillsDatatable < BaseDatatable
  delegate :edit_skill_category_skill_path, :skill_category_skill_path, to: :@view

  # Get result
  def as_json(options = {})
    {
      iTotalRecords: Skill.count,
      iTotalDisplayRecords: skills.total_entries,
      aaData: data
    }
  end

private
  # Map skills to data
  def data
    skills.map do |skill|
      edit_path = link_to(fa_icon('edit lg'), edit_skill_category_skill_path(id: skill.id))
      delete_path = link_to(fa_icon('trash-o lg'), skill_category_skill_path(id: skill.id), method: :delete, data: { confirm: I18n.t('skills.index.delete_confirm') })
      [
        skill.name,
        skill.description,
        "#{edit_path} #{delete_path}"
      ]
    end
  end

  def skills
    @skills ||= fetch_skills
  end

  def fetch_skills
    skills = Skill.order("#{sort_column} #{sort_direction}")
    skills = skills.page(page).per_page(per_page)

    if params["search"]["value"].present?
      skills = skills.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    skills
  end

  def sort_column
    columns = %w[name description]
    super columns
  end
end