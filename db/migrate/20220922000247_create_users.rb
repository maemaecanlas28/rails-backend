class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email
      t.datetime :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
