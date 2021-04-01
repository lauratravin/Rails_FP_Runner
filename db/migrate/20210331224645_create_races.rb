class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name
      t.date   :date
      t.integer :miles
      t.boolean  :status 
      t.timestamps null: false
    end
  end
end
