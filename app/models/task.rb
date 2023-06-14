class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 500 }
  enum status: { not_started: 0, started: 1, completed: 2 }
end
