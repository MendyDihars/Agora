class Chat < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  validates :content, presence: true
end
