class Member < ApplicationRecord
  validates :name, presence: true
  validates :grade, presence: true
  validates :status, presence: true

  enum grade: { professor: 0, doctor_second: 1, doctor_first: 2 , master_second: 3, master_first: 4, bachelor_fourth: 5, bachelor_third: 6 }
  enum status: { room: 0, laboratory: 1, workshop: 2, lesson: 3, lunch: 4, ogigaoka: 5, off_campus: 6, home: 7, absence: 8, job_hunting: 9, home_town: 10 }

  attribute :changed_at, :datetime, default: Proc.new { DateTime.current }
  attribute :status, :integer, default: :home
  attribute :grade, :integer, default: :bachelor_fourth

  has_many :logs
end
