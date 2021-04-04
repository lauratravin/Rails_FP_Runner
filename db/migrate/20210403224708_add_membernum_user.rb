class AddMembernumUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :member_nun, :string

  end
end
