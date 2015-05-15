class SkillService
  def get_skill_hierarchy
    categories = SkillCategory.all.map {|r| r.node}
    skills = Skill.all.map {|r| r.node}
    categories + skills
  end
end