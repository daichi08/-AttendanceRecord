class MembersController < ApplicationController
  def index
    @members = Member.order(:grade).order(:id)
  end

  def update
    unless params[:id].to_i.zero?
      if params[:id].length == 1
        build_log_and_update(Member.find(params[:id]))
      else
        ids = params[:id].scan(/\w+/)
        ApplicationRecord.transaction do
          Member.where(id: ids).each do |member|
            build_log_and_update(member)
          end
        end
      end
    end
    redirect_to :root
  end

  def logs
    @logs = Member.find(params[:member_id]).logs.active_logs
    respond_to do | format |
      format.html
      format.csv do
        filename = @logs.first.member.name
        headers["Content-Disposition"] = "attachment; filename=\"#{filename}_logs.csv\""
      end
    end
  end

  private

  def build_log_and_update(member)
    member.build_log
    member.update_status(params[:status])
  end
end
