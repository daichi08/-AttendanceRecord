class MembersController < ApplicationController
  def index
    @members = Member.order(:grade)
    @statuses = Member.statuses
  end
end
