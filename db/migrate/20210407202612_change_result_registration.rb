class ChangeResultRegistration < ActiveRecord::Migration[6.1]
  def change
    change_column :registrations, :result, :float

  end
end
