class Member < ApplicationRecord
  validates :name, presence: true
  validates :grade, presence: true
  validates :status, presence: true

  enum grade: { professor: 0, doctor_second: 1, doctor_first: 2 , master_second: 3, master_first: 4, bachelor_fourth: 5, bachelor_third: 6 }
  enum status: { room: 0, laboratory: 1, workshop: 2, lesson: 3, lunch: 4, ogigaoka: 5, off_campus: 6, house: 7, absence: 8, job_hunting: 9, home_town: 10 }

  attribute :changed_at, :datetime, default: Proc.new { DateTime.current }
  attribute :status, :integer, default: :home
  attribute :grade, :integer, default: :bachelor_fourth

  has_many :logs

  scope(:active_ids, -> { where(status: 0..6).ids })

  def build_log
    logs.build(
      status: status,
      started_at: changed_at,
    )
  end

  def update_status(status)
    update!(
      status: status,
      changed_at: DateTime.current
    )
  end

  def current_status(box_status)
    status == box_status
  end
end
