class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.date :hold_date
      t.string :presenter1
      t.string :presenter2
      t.text :theme1
      t.text :theme2

      t.timestamps null: false
    end
  end
end
