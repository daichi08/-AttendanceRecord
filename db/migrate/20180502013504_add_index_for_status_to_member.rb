class AddIndexForStatusToMember < ActiveRecord::Migration[5.2]
  def change
    add_index :members, :status
  end
end
