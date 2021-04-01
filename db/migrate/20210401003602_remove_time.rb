class RemoveTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :time
  end
end
