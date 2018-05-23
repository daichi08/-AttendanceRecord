class AddIndexToMember < ActiveRecord::Migration[5.2]
  def change
    add_index :members, :grade
  end
end
