class RankService < BaseService
  # Save rank
  def save_rank(rank)
    rank.save
  end

  # Update rank
  def update_rank(rank, params)
    rank.update(params)
  end

  # Delete rank
  def destroy_rank(rank)
    rank.destroy
  end

  # Update user skills
  def update_rank_skills(rank, skill_ids)
    Skill.transaction do
      rank.skills.clear
      skill_ids.each {|skill_id| rank.skills << Skill.find(skill_id) if is_id?(skill_id)}
    end
  end
end