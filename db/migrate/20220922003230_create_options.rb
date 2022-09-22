class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :score
      t.belongs_to :board

      t.timestamps
    end
  end
end
