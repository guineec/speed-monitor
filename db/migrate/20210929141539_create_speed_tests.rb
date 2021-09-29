class CreateSpeedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :speed_tests do |t|
      t.string :status, null: false
      t.integer :ping
      t.integer :download
      t.integer :upload

      t.timestamps
    end
  end
end
