class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :sur_name, :location, :team, presence: true
  belongs_to :location
  belongs_to :team
  has_many :qualifications, dependent: :destroy

  def active_for_authentication?
    super && status?
  end

  def self.statuses
    [['Enabled', true], ['Disabled', false]]
  end

  def full_name
    first_name + ' ' + sur_name
  end
end
