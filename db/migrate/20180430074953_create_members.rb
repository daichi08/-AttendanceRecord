class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :grade
      t.integer :status
      t.datetime :changed_at

      t.timestamps
    end
  end
end
