class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :category
      t.text :description
      t.string :title
      t.datetime :end_date
      t.string :tags, array: true, default: []
      t.belongs_to :user

      t.timestamps
    end
  end
end
