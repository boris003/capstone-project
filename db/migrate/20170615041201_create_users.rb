class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :nickname
      t.date :date_of_birth
      t.string :location
      t.string :drone_model
      t.text :bio

      t.timestamps
    end
  end
end
