class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :rankings, array: true, default: []
      t.belongs_to :board
      t.belongs_to :user

      t.timestamps
    end
  end
end
