class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid
      t.string :image
      t.date   :date
      t.integer  :pace
      t.string   :password_digest
  
      t.timestamps null: false
    end
  end
end
