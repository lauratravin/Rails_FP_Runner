class FixColumnnameRegistration < ActiveRecord::Migration[6.1]
  def change
    rename_column :registrations, :registration_id, :race_id

  end
end
