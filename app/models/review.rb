class Review < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :meeting

  validates :content, length: { in: 15..300 }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false },
              numericality: { only_integer: true }
end
