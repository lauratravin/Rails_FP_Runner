class ChangeTypeNumberRegistration < ActiveRecord::Migration[6.1]
  def change
    change_column :registrations, :estimated, :float

  end
end
