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

  has_many :chats

  has_many :meetings_teacher, class_name: 'Meeting', foreign_key: "teacher_id"
  has_many :meetings_student, class_name: 'Meeting', foreign_key: "student_id"

  has_many :reviews_received, class_name: 'Review', foreign_key: 'teacher_id'
  has_many :reviews_written, class_name: 'Review', foreign_key: 'student_id'

  has_many :own_skills, through: :user_skills, source: :skill
  has_many :wanted_skills, through: :requested_skills, source: :skill

  has_one :mendie

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true


  def can_validate?(meeting)
    meeting.happened? && meeting.approved? && meeting.student?(self) && meeting.validate_at == nil
  end

  def can_review? meeting
    meeting != nil && meeting.student?(self) && meeting.approved? && meeting.happened?
  end
end
