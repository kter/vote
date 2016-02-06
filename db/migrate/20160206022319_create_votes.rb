class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.date :hold_date
      t.string :presenter
      t.integer :score
      t.text :comment

      t.timestamps null: false
    end
  end
end
