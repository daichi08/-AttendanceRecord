class MembersController < ApplicationController
  def index
    @members = Member.order(:grade)
    @statuses = Member.statuses
  end

  def update
    unless params[:id].to_i.zero?
      if params[:id].length == 1
        changed_member = Member.find(params[:id])
        changed_member.logs.build(
          status: changed_member.status,
          started_at: changed_member.changed_at,
          changed_at: DateTime.current
        )
        changed_member.update(
          status: params[:status],
          changed_at: DateTime.current
        )
      else
        ids = params[:id].scan(/\w+/)
        Member.where(id: ids).each do | member |
          member.logs.build(
            status: member.status,
            started_at: member.changed_at,
            changed_at: DateTime.current
          )
          member.update(
            status: params[:status],
            changed_at: DateTime.current
          )
        end
      end
    end
    redirect_to :root
  end
end
