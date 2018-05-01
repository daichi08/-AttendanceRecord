class MembersController < ApplicationController
  def index
    @members = Member.order(:grade)
    @statuses = Member.statuses
  end

  def update
    ids = params[:id].scan(/\w+/)
    status_array = Array.new(ids.size, { status: params[:status] })
    Member.update(ids, status_array)
    redirect_to :root
  end
end
