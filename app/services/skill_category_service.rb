class SkillCategoryService < BaseService
  include Rails.application.routes.url_helpers

  # Save skill category
  def save_skill_category(skill_category)
    skill_category.save
  end

  # Update skill category
  def update_skill_category(skill_category, params)
    skill_category.update(params)
  end

  # Delete skill category
  def destroy_skill_category(skill_category)
    skill_category.destroy
  end

  # Get skill categories and skills hierarchy
  def get_hierarchy
    categories = SkillCategory.all.map {|category| get_skill_category_node(category)}
    skills = Skill.all.map {|skill| get_skill_node(skill)}
    categories + skills
  end

  # Get skill category node data
  def get_skill_category_node(category)
    node_id = "category_#{category.id}"
    node_parent = category.parent.nil? ? "#" : "category_#{category.parent_id}"

    {
      id: node_id,
      text: category.name,
      parent: node_parent,
      icon: "glyphicon glyphicon-folder-close",
      a_attr: {
        new_children_path: new_skill_category_skill_path(category),
        edit_path: edit_skill_category_path(category),
        delete_path: skill_category_path(category)
      }
    }
  end

  # Get skill node data
  def get_skill_node(skill)
    node_id = "skill_#{skill.id}"
    node_parent = "category_#{skill.skill_category.id}"

    {
      id: node_id,
      text: skill.name,
      parent: node_parent,
      icon: "glyphicon glyphicon-leaf",
      a_attr: {
        edit_path: edit_skill_category_skill_path(id: skill, skill_category_id: skill.skill_category),
        delete_path: skill_category_skill_path(id: skill, skill_category_id: skill.skill_category)
      }
    }
  end
end