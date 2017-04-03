class AddTimeAndDurationToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :time, :string
    add_column :klasses, :duration, :string
  end
end
