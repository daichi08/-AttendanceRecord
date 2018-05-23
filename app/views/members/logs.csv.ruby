require "csv"
require "nkf"

cols = %w(行動内容 開始時刻 終了時刻 活動時間[h])

csv_str = CSV.generate do | csv |
  csv << cols
  @logs.each do |log|
    csv << [
      log.status,
      log.started_at.strftime("%Y-%m-%d %H:%M:%S"),
      log.changed_at.strftime("%Y-%m-%d %H:%M:%S"),
      log.active_time
    ]
  end
end

NKF.nkf("--sjis -Lw", csv_str)