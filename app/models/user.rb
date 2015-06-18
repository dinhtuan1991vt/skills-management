class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :sur_name, presence: true
  belongs_to :location
  belongs_to :team
  has_many :qualifications, dependent: :destroy
  has_and_belongs_to_many :skills, join_table: :users_skills
  has_and_belongs_to_many :roles, join_table: :users_roles

  def active_for_authentication?
    super && status?
  end

  # Get user statuses
  def self.statuses
    [['Enabled', true], ['Disabled', false]]
  end

  # Get full name
  def full_name
    "#{first_name} #{sur_name}"
  end

  # Get user skill-set types
  def self.skill_set_types
    [['Use all skills', 0],
    ['Use team skills', 1],
    ['Use role skills', 2],
    ['Custom', 3]]
  end
end
