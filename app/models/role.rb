class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
  validates :name, presence: true
  scopify

  # Get types of roles
  # Follow this page http://wiki.skills-base.com/index.php?title=Security
  def self.roles
    [['Admin', 'Admin'],
    ['Supervisor', 'Supervisor'],
    ['General Staff', 'GeneralStaff']]
  end
end
