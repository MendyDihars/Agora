class Chat < ApplicationRecord
  belongs_to :meeting
  belongs_to :student
  belongs_to :teacher
end
