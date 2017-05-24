class Skill < ApplicationRecord

  has_many :user_skills
  has_many :requested_skills
  has_many :meetings
  has_many :users, through: :user_skills
  has_many :users, through: :requested_skills

  validates :name, presence: true
end
