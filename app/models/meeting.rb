class Meeting < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :skill

  validates :happen_at, presence: true
end
