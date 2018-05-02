class Log < ApplicationRecord
  validates :status, presence: true
  validates :started_at, presence: true
  validates :changed_at, presence: true

  enum status: { room: 0, laboratory: 1, workshop: 2, lesson: 3, lunch: 4, ogigaoka: 5, off_campus: 6, house: 7, absence: 8, job_hunting: 9, home_town: 10 }

  attribute :changed_at, :datetime, default: Proc.new { DateTime.current }

  belongs_to :member
end
