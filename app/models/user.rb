class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attachment :photo
  has_many :requested_skills
  has_many :user_skills
  has_many :meetings, class_name: 'User', foreign_key: "teacher_id"
  has_many :meetings, class_name: 'User', foreign_key: "student_id"
  has_many :own_skills, through: :user_skills, source: :skill
  has_many :wanted_skills, through: :requested_skills, source: :skill

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  # accepts_nested_attributes_for :user_skills
  # accepts_nested_attributes_for :own_skills
end
