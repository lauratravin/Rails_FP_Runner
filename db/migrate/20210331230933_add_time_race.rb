class AddTimeRace < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :time, :time
  end
end
