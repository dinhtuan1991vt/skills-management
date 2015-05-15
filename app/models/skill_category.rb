class SkillCategory < ActiveRecord::Base
  has_many :skills, dependent: :nullify
  has_many :children, class_name: "SkillCategory", foreign_key: "parent_id"
  belongs_to :parent, class_name: "SkillCategory"

  validates :name, presence: true

  def node
    node_id = "category_#{id}"
    node_parent = parent.nil? ? "#" : "category_#{parent_id}"

    {id: node_id, text: name, parent: node_parent, icon: "glyphicon glyphicon-folder-close"}
  end
end
