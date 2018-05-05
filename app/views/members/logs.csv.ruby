require "csv"
require "nkf"

csv_str = CSV.generate do | csv |
  @logs.each do | log |
    csv << []
  end
end

NKF.nkf("--sjis -Lw", csv_str)