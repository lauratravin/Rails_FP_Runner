class CorrectNameUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :member_nun, :member_num

  end
end
