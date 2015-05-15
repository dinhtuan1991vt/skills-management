class Skill < ActiveRecord::Base
  belongs_to :skill_category
  validates :name, :description, presence: true

  def node
    node_id = "skill_#{id}"
    node_parent = "category_#{skill_category_id}"

    {id: node_id, text: name, parent: node_parent, icon: "glyphicon glyphicon-leaf"}
  end
end