class AddGoogcoordRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :latitud, :string
    add_column :races, :longitud, :string

  end
end
