class NewTableGoal < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :year
      t.integer   :miles
      t.timestamps null: false
    end
  end
end
