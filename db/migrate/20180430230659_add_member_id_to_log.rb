class AddMemberIdToLog < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :member, foreign_key: true
  end
end
