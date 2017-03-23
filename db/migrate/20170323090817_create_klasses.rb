class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.time :time
      t.integer :room_no
      t.string :place
      t.string :course
      t.string :teacher
      t.time :duration

      t.timestamps null: false
    end
  end
end
