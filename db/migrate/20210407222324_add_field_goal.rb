class AddFieldGoal < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :user_id, :integer
  end
end
