class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.datetime :started_at
      t.datetime :changed_at
      t.integer :status

      t.timestamps
    end
  end
end
