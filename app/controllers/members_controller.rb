class MembersController < ApplicationController
  def index
    @members = Member.order(:grade)
    @statuses = Member.statuses
  end

  def update
    if params[:id].length == 1
      changed_user = Member.find(params[:id])
      changed_user.update(status: params[:status])
    else
      ids = params[:id].scan(/\w+/)
      status_array = Array.new(ids.size, { status: params[:status] })
      Member.update(ids, status_array)
    end
    redirect_to :root
  end
end
