class RenameColumnUser < ActiveRecord::Migration[6.1]
  def change 
    rename_column :users, :date, :dob
  end
end
