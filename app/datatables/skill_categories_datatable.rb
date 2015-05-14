class SkillCategoriesDatatable < BaseDatatable
  delegate :edit_skill_category_path, :skill_category_skills_path, to: :@view

  def as_json(options = {})
    {
      iTotalRecords: SkillCategory.count,
      iTotalDisplayRecords: skill_categories.total_entries,
      aaData: data
    }
  end

private
  def data
    skill_categories.map do |category|
      [
        link_to(category.name, skill_category_skills_path(category)),
        link_to(fa_icon('edit lg'), edit_skill_category_path(category)) + " " + link_to(fa_icon('trash-o lg'), category, method: :delete, data: { confirm: I18n.t('skill_categories.index.delete_confirm') })
      ]
    end
  end

  def skill_categories
    @skill_categories ||= fetch_skill_categories
  end

  def fetch_skill_categories
    skill_categories = SkillCategory.order("#{sort_column} #{sort_direction}")
    skill_categories = skill_categories.page(page).per_page(per_page)

    if params["search"]["value"].present?
      skill_categories = skill_categories.where("name like :search", search: "%#{params["search"]["value"]}%")
    end
    skill_categories
  end

  def sort_column
    columns = %w[name]
    super columns
  end
end