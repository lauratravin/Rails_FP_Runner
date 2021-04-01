class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :registration_id
      t.integer :result
      t.integer :estimated
      t.timestamps null: false
    end
  end
end
