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
    # set option
    HierachyOption.can_edit = true
    # get hierachy
    categories = SkillCategory.all.map {|category| get_skill_category_node(category)}
    skills = Skill.all.map {|skill| get_skill_node(skill)}
    categories + skills
  end

  # Get skill categories and skills hierarchy - checked
  def get_hierarchy_checked(id, skill_set_type)
    HierachyOption.can_edit = false
    categories = SkillCategory.all.map {|category| get_skill_category_node(category)}
    skills = Skill.all.map {|skill| get_skill_node_checked(id, skill, skill_set_type)}
    categories + skills
  end

    # Get skill categories and skills hierarchy - checked
  def get_hierarchy_pure
    HierachyOption.can_edit = false
    categories = SkillCategory.all.map {|category| get_skill_category_node(category)}
    skills = Skill.all.map {|skill| get_skill_node(skill)}
    categories + skills
  end

  protected
    # Constant
    SKILL_SET_TYPES = {
        all_skill: 0,
        team_skill: 1,
        role_skill: 2,
        custom: 3
    }
    # sub-class
    class HierachyOption
      class <<self
        attr_accessor :can_edit
      end
      @@can_edit = true
    end
    # Get skill category node data
    def get_skill_category_node(category)
      node_id = "category_#{category.id}"
      node_parent = category.parent.nil? ? "#" : "category_#{category.parent_id}"

      hierachy = {
        id: node_id,
        text: category.name,
        parent: node_parent,
        icon: "glyphicon glyphicon-folder-close"
      }

      if HierachyOption.can_edit
        hierachy[:a_attr] = {
          new_children_path: new_skill_category_skill_path(category),
          edit_path: edit_skill_category_path(category),
          delete_path: skill_category_path(category)
        }
      end

      hierachy

    end

    # Get skill node data
    def get_skill_node(skill)
      node_id = skill.id
      node_parent = "category_#{skill.skill_category.id}"

      hierachy = {
        id: node_id,
        text: skill.name,
        parent: node_parent,
        icon: "glyphicon glyphicon-leaf"
      }

      if HierachyOption.can_edit
        hierachy[:a_attr] = {
          edit_path: edit_skill_category_skill_path(id: skill, skill_category_id: skill.skill_category),
          delete_path: skill_category_skill_path(id: skill, skill_category_id: skill.skill_category)
        }
      end

      hierachy

    end

    # Get skill node data - checked
    def get_skill_node_checked(id, skill, skill_set_type)
      case SKILL_SET_TYPES.key skill_set_type
      when :custom
        user = User.find(id)
        is_checked = user.skills.pluck(:id).include?(skill.id)
      when :team_skill
        team = Team.find(id)
        is_checked = team.skills.pluck(:id).include?(skill.id)
      end

      node_parent = "category_#{skill.skill_category.id}"
      {
        id: skill.id,
        text: skill.name,
        parent: node_parent,
        icon: "glyphicon glyphicon-leaf",
        state: {
          selected: is_checked
        }
      }
    end
end