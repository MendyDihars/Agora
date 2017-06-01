class Meeting < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :skill
  has_many   :reviews
  has_many   :chats

  validates :happen_at, presence: true
  validates :skill, presence: true

  def happened?
    happen_at < Time.current
  end

  def approved?
    approved_at != nil && rejected_at == nil
  end

  def student?(user)
    user == student
  end

  def validate?
    validate_at != nil
  end

  def teacher?(user)
    user == teacher
  end

  def approved_message?
    approved_message != nil && approved_message != ""
  end

  def message?
    message != nil && message != ""
  end
end
